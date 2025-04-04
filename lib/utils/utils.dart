import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_strings.dart';
import 'package:jiffy/jiffy.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart' as intl;

class Utils {
  static bool get isArabic => translator.activeLocale.languageCode == "ar";

  static TextDirection get textDirection =>
      isArabic ? TextDirection.rtl : TextDirection.ltr;
  static bool get currencyLeftSided {
    final currencyConfig = AppStrings.currencyConfig;
    final currencyLocation = currencyConfig["location"] ?? 'left';
    return currencyLocation.toLowerCase() == "left";
  }

  static bool isDark(Color color) {
    return ColorUtils.calculateRelativeLuminance(
            color.r.toInt(), color.g.toInt(), color.b.toInt()) <
        0.5;
  }

  static bool isPrimaryColorDark([Color? mColor]) {
    final color = mColor ?? AppColors.primaryColor;
    return ColorUtils.calculateRelativeLuminance(
            color.r.toInt(), color.g.toInt(), color.b.toInt()) <
        0.5;
  }

  static Color textColorByTheme([bool reversed = false]) {
    if (reversed) {
      return !isPrimaryColorDark() ? Colors.white : Colors.black;
    }
    return isPrimaryColorDark() ? Colors.white : Colors.black;
  }

  static Color textColorByBrightness(BuildContext context,
      [bool reversed = false]) {
    if (reversed) {
      return !context.isDarkMode ? Colors.white : Colors.black;
    }
    return context.isDarkMode ? Colors.white : Colors.black;
  }

  static Color textColorByColor(Color color) {
    return isPrimaryColorDark(color) ? Colors.white : Colors.black;
  }

  static setJiffyLocale() async {
    String cLocale = translator.activeLanguageCode;
    List<String> supportedLocales = Jiffy.getSupportedLocales();
    if (supportedLocales.contains(cLocale)) {
      await Jiffy.setLocale(cLocale);
    } else {
      await Jiffy.setLocale("en");
    }
  }

  static Future<XFile?> compressFile({
    required File file,
    String? targetPath,
    int quality = 40,
    CompressFormat format = CompressFormat.jpeg,
  }) async {
    targetPath ??=
        "${file.parent.path}/compressed_${file.path.split('/').last}";

    if (kDebugMode) {
      print("file path ==> $targetPath");
    }

    FlutterImageCompress.validator.ignoreCheckExtName = true;
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
      format: format,
    );
    if (kDebugMode) {
      print("unCompress file size ==> ${file.lengthSync()}");
      if (result != null) {
        final compressedSize = await result.length();
        print("Compress file size ==> $compressedSize");
      } else {
        print("compress failed");
      }
    }

    return result;
  }

  static bool isDefaultImg(String? url) {
    return url == null ||
        url.isEmpty ||
        url == "default.png" ||
        url == "default.jpg" ||
        url == "default.jpeg" ||
        url.contains("default.png");
  }

  //
  //get country code
  static Future<String> getCurrentCountryCode() async {
    String countryCode = "US";
    try {
      //make request to get country code
      final response =
          await Dio().get("http://ip-api.com/json/?fields=countryCode");
      //get the country code
      countryCode = response.data["countryCode"];
    } catch (e) {
      countryCode = AppStrings.defaultCountryCode;
    }

    return countryCode.toUpperCase();
  }

  static String formatCurrencyVND(double amount) {
    String formattedAmount =
        intl.NumberFormat("#,##0.", "vi_VN").format(amount);
    return "$formattedAmount đ".replaceAll(",", "");
  }

  static String? checkForbiddenWordsInMap(Map<String, dynamic> map) {
    final forbiddenWords = AppStrings.forbiddenWords;
    for (var value in map.values) {
      if (value is String) {
        for (var word in forbiddenWords) {
          if (value.toLowerCase().contains(word.toLowerCase())) {
            return word;
          }
        }
      } else if (value is List) {
        for (var item in value) {
          if (item is String) {
            for (var word in forbiddenWords) {
              if (item.toLowerCase().contains(word.toLowerCase())) {
                return word;
              }
            }
          }
        }
      }
    }
    return null;
  }

  static String? checkForbiddenWordsInString(String string) {
    final forbiddenWords = AppStrings.forbiddenWords;
    for (var word in forbiddenWords) {
      if (string.toLowerCase().contains(word.toLowerCase())) {
        return word;
      }
    }
    return null;
  }

  static String timeDifference(DateTime date) {
    final now = DateTime.now();
    final diffInMs = now.difference(date).inMilliseconds;

    final units = [
      {'label': 'year', 'ms': 365 * 24 * 60 * 60 * 1000},
      {'label': 'month', 'ms': 30 * 24 * 60 * 60 * 1000},
      {'label': 'day', 'ms': 24 * 60 * 60 * 1000},
      {'label': 'hour', 'ms': 60 * 60 * 1000},
      {'label': 'minute', 'ms': 60 * 1000},
      {'label': 'second', 'ms': 1000},
    ];

    for (var unit in units) {
      final value = (diffInMs / (unit['ms'] as int)).floor();
      if (value > 0) {
        return 'Created $value ${unit['label']}${value > 1 ? 's' : ''} ago';
      }
    }

    return 'just now';
  }

  // Kiểm tra hình ảnh sản phẩm có hợp lệ hay không
  static Future<bool> checkImageUrl(String photoToCheck) async {
    final response = await Dio().head(photoToCheck);
    if (response.statusCode == 200) return true;
    return false;
  }

  //Chuyển từ map sang string
  static String toQueryString(Map<String, dynamic> params,
      {List<dynamic>? exclude}) {
    try {
      if (exclude != null) {
        for (var element in exclude) {
          params.remove(element);
        }
      }
      return params.entries
          .map((entry) =>
              '${Uri.encodeQueryComponent(entry.key)}=${Uri.encodeQueryComponent(entry.value.toString())}')
          .join('&');
    } catch (e) {
      debugPrint("Error when format string");
      return "";
    }
  }

  static Future<String?> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
    } catch (e) {
      print('Failed to get device info: $e');
    }
    return null;
  }
}
