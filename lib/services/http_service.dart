import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/foundation.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/hive_service.dart';
import 'package:real_estate_fe/services/local_storage_service.dart';
import 'package:real_estate_fe/utils/utils.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'package:stacked/stacked.dart';

abstract class HttpService<T> with ListenableServiceMixin {
  String host = Api.baseUrl;
  BaseOptions? baseOptions;
  Dio? dio;
  SharedPreferences? prefs;
  T? data;
  late HiveService<Map<String, dynamic>> hiveService;
  Future<Map<String, String>> getHeaders() async {
    final userToken = await AuthService().getAuthBearerToken();
    debugPrint('User token:($userToken)');
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $userToken",
      "lang": translator.activeLanguageCode,
    };
  }

  HttpService() {
    LocalStorageService.getPrefs();
    baseOptions = BaseOptions(
      baseUrl: host,
      validateStatus: (status) {
        return status != null && status <= 500;
      },
      // connectTimeout: 300,
    );
    if (dio == null) {
      dio = Dio(baseOptions);
      if (!kIsWeb) {
        dio!.interceptors.add(getCacheManager().interceptor);
      }
      dio!.interceptors.add(InterceptorsWrapper(
        onResponse: (r, handler) {
          debugPrint("Response received from API: ${r.requestOptions.uri}");
          debugPrint("Status code: ${r.statusCode}");
          debugPrint("Data: ${r.data}");
          handler.next(r);
        },
        onError: (e, handler) {
          debugPrint(
              "Response from request with url: ${e.response?.requestOptions.uri}");
          debugPrint("Request failed: ${e.response?.statusCode}");
          debugPrint("Error message: ${e.message}");
          debugPrint("Server response: ${e.response?.data}");
          handler.next(e);
        },
      ));
    }
    hiveService = HiveService(name: "default");
    listenToReactiveValues([data]);
  }

  DioCacheManager getCacheManager() {
    return DioCacheManager(
      CacheConfig(
        baseUrl: host,
        defaultMaxAge: const Duration(hours: 1),
      ),
    );
  }

  bool? forceRefresh;
  //for get api calls
  //for get api calls with cache options
  Future<T?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool includeHeaders = true,
    bool staleWhileRevalidate = true,
    String? hostUrl,
    Map<String, dynamic>? headers,
    bool forceRefresh = false, // add this parameter for cache control
  }) async {
    try {
      String uri;
      if (hostUrl == null) {
        uri = "$host$url";
      } else {
        uri = "$hostUrl$url";
      }

      // Set up cache options for Dio
      final cacheOptions = buildCacheOptions(
        const Duration(hours: 1),
        forceRefresh: forceRefresh,
      );

      final dioOptions = Options(
        headers: headers ?? await getHeaders(),
        extra: !kIsWeb ? cacheOptions.extra : null,
      );
      // Attempt to fetch cached data from Dio cache
      Response? cachedResponse;
      if (!forceRefresh) {
        try {
          cachedResponse = await dio!.get(
            uri,
            options: dioOptions.copyWith(
              extra: {
                ...?dioOptions.extra,
                'fromNetwork': false, // Fetch from cache only
              },
            ),
            queryParameters: queryParameters,
          );
        } catch (_) {
          // No valid cache found; fallback to Hive
        }
      }

      if (cachedResponse != null && cachedResponse.data != null) {
        debugPrint("Found data from Dio cache: ${cachedResponse.data}");
        data = fromResponse(cachedResponse);
        return data;
      }
      if (staleWhileRevalidate && !forceRefresh) {
        if (uri != hiveService.name) {
          hiveService = HiveService<Map<String, dynamic>>(
              name: url.replaceAll("/", ".").substring(1));
        }
        final hiveData = await hiveService.readData(Utils.toQueryString(
            queryParameters ?? {},
            exclude: ["longitude", "latitude"]));
        if (hiveData != null) {
          debugPrint("Found data from HiveStorage: $hiveData");
          data = parser(hiveData);
          notifyListeners();
          callApiAndSave(uri, dioOptions, queryParameters).then((response) {
            data = fromResponse(response);
          });
          return data!;
        } else {
          await callApiAndSave(uri, dioOptions, queryParameters)
              .then((response) {
            data = fromResponse(response);
          });
          return data!;
        }
      }

      // Fallback: Make an actual API call and save to cache/Hive
      Response apiResponse = await callApi(uri, dioOptions, queryParameters);
      data = fromResponse(apiResponse);
      return data;
    } finally {
      notifyListeners();
    }
  }

  Future<Response> callApiAndSave(String uri, Options mOptions,
      Map<String, dynamic>? queryParameters) async {
    Response response = await callApi(uri, mOptions, queryParameters);
    final data = response.data is Map ? response.data : {"data": response.data};
    await hiveService.save(
        Utils.toQueryString(queryParameters ?? {},
            exclude: ["longitude", "latitude"]),
        data);
    return response;
  }

  Future<Response> callApi(String uri, Options mOptions,
      Map<String, dynamic>? queryParameters) async {
    Response response;
    try {
      response = await dio!.get(
        uri,
        options: mOptions,
        queryParameters: queryParameters,
      );
    } on DioException catch (error) {
      debugPrint(error.toString());
      response = formatDioException(error);
    }
    return response;
  }

  //for post api calls
  Future<Response> post(
    String url,
    body, {
    bool includeHeaders = true,
    String? hostUrl,
    Map<String, dynamic>? headers,
  }) async {
    //preparing the api uri/url
    String uri;
    if (hostUrl == null) {
      uri = "$host$url";
    } else {
      uri = "$hostUrl$url";
    }
    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: headers ?? await getHeaders(),
          );

    Response response;
    try {
      response = await dio!.post(
        uri,
        data: body,
        options: mOptions,
      );
    } on DioException catch (error) {
      response = formatDioException(error);
    }

    return response;
  }

  //for post api calls with file upload
  Future<Response> postWithFiles(
    String url,
    body, {
    bool includeHeaders = true,
    String? hostUrl,
    FormData? formData,
    Map<String, dynamic>? headers,
  }) async {
    //preparing the api uri/url
    String uri;
    if (hostUrl == null) {
      uri = "$host$url";
    } else {
      uri = "$hostUrl$url";
    }
    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: headers ?? await getHeaders(),
          );

    Response response;
    try {
      response = await dio!.post(
        uri,
        data: formData ?? FormData.fromMap(body),
        options: mOptions,
      );
    } on DioException catch (error) {
      response = formatDioException(error);
    }

    return response;
  }

  Future<Response> postCustomFiles(
    String url,
    body, {
    FormData? formData,
    bool includeHeaders = true,
  }) async {
    //preparing the api uri/url
    String uri = "$host$url";
    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: await getHeaders(),
          );

    Response response;

    try {
      response = await dio!.post(
        uri,
        data: formData ?? FormData.fromMap(body),
        options: mOptions,
      );
    } on DioException catch (error) {
      response = formatDioException(error);
    }

    return response;
  }

  //for patch api calls
  Future<Response> patch(
    String url,
    Map<String, dynamic> body, {
    String? hostUrl,
    Map<String, dynamic>? headers,
  }) async {
    String uri;
    if (hostUrl == null) {
      uri = "$host$url";
    } else {
      uri = "$hostUrl$url";
    }
    Response response;

    try {
      response = await dio!.patch(
        uri,
        data: body,
        options: Options(
          headers: headers ?? await getHeaders(),
        ),
      );
    } on DioException catch (error) {
      response = formatDioException(error);
    }

    return response;
  }

  Future<Response> patchWithFiles(
    String url,
    dynamic body, {
    String? hostUrl,
    Map<String, dynamic>? headers,
  }) async {
    String uri;
    if (hostUrl == null) {
      uri = "$host$url";
    } else {
      uri = "$hostUrl$url";
    }
    Response response;

    try {
      response = await dio!.post(
        uri,
        data: body is FormData ? body : FormData.fromMap(body),
        options: Options(
          headers: headers ?? await getHeaders(),
        ),
      );
    } on DioException catch (error) {
      debugPrint('Lỗi: ${error.message}');
      response = formatDioException(error);
    }

    return response;
  }

  //for delete api calls
  Future<Response> delete(
    String url, {
    String? hostUrl,
    Map<String, dynamic>? headers,
  }) async {
    String uri;
    if (hostUrl == null) {
      uri = "$host$url";
    } else {
      uri = "$hostUrl$url";
    }

    Response response;
    try {
      response = await dio!.delete(
        uri,
        options: Options(
          headers: headers ?? await getHeaders(),
        ),
      );
      debugPrint("Future<Response> delete Call here!!!");
    } on DioException catch (error) {
      response = formatDioException(error);
    }
    return response;
  }

  Response formatDioException(DioException ex) {
    var response = Response(requestOptions: ex.requestOptions);
    debugPrint("type ==> ${ex.type}");
    response.statusCode = 400;
    String? msg = response.statusMessage;

    try {
      if (ex.type == DioExceptionType.connectionTimeout) {
        msg =
            "Connection timeout. Please check your internet connection and try again"
                .tr();
      } else if (ex.type == DioExceptionType.sendTimeout) {
        msg =
            "Timeout. Please check your internet connection and try again".tr();
      } else if (ex.type == DioExceptionType.receiveTimeout) {
        msg =
            "Timeout. Please check your internet connection and try again".tr();
      } else if (ex.type == DioExceptionType.badResponse) {
        msg =
            "Connection timeout. Please check your internet connection and try again"
                .tr();
      } else {
        msg = "Please check your internet connection and try again".tr();
      }
      response.data = {"message": msg};
    } catch (error) {
      response.statusCode = 400;
      msg = "Please check your internet connection and try again".tr();
      response.data = {"message": msg};
    }

    throw msg;
  }

  //NEUTRALS
  Future<Response> getExternal(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio!.get(
      url,
      queryParameters: queryParameters,
    );
  }

  T parser(Map<String, dynamic> hiveMap);
  T fromResponse(Response response);
}
