import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/constants/app_strings.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/http_service.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/utils/utils.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supercharged/supercharged.dart';

class AuthService extends HttpService<User?> {
  final fba.FirebaseAuth _firebaseAuth = fba.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  static AppService appService = locator<AppService>();
  static User? currentUser;
  Stream<fba.User?> get userStream => _firebaseAuth.authStateChanges();
  Future<User?> registerWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    final response = await post(Api.register, {
      "email": email,
      "password": password,
      "name": username,
      "phone": phone,
    });
    if (response.statusCode == 201) {
      return User.fromJson(response.data);
    }
    throw Exception(
        "Error when register with email: ${response.statusMessage}");
  }

  Future<String?> getDeviceToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String? token = await messaging.getToken();
    return token;
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final deviceToken = await getDeviceToken();

      final response = await post(Api.login, {
        "email": email,
        "password": password,
        if (deviceToken != null) "device_token": deviceToken
      });
      if (response.statusCode == 200) {
        setAuthBearerToken(response.data["token"]);
        return saveUser(response.data["user"]);
      }
      throw Exception("Sign in error: ${response.statusMessage}");
    } on fba.FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  Future<fba.User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = fba.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } on fba.FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  String _handleFirebaseError(fba.FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Không tìm thấy người dùng';
      case 'wrong-password':
        return 'Sai mật khẩu';
      case 'invalid-email':
        return 'Email không hợp lệ';
      case 'user-disabled':
        return 'Tài khoản đã bị vô hiệu hóa';
      case 'operation-not-allowed':
        return 'Phương thức đăng nhập không được hỗ trợ';
      default:
        return 'Đăng nhập thất bại. Vui lòng thử lại';
    }
  }

  Future<String> getAuthBearerToken() async {
    return localStorageService.prefs?.getString(AppStrings.userAuthToken) ?? "";
  }

  Future<bool> setAuthBearerToken(token) async {
    return localStorageService.prefs!
        .setString(AppStrings.userAuthToken, token);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await localStorageService.prefs?.clear();
    currentUser = null;
    notifyListeners();
    appService.changeIndex(0);
    _navigationService.clearStackAndShow(Routes.welcomeView);
  }

  @override
  fromResponse(Response response) {
    if (response.statusCode! > 300) return null;
    if ((response.data as Map).containsKey("token")) {
      setAuthBearerToken(response.data["token"]);
      return saveUser(response.data["user"]);
    } else {
      return saveUser(response.data);
    }
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return saveUser(hiveMap["data"]);
  }

  User saveUser(data) {
    if (data is! Map) throw Exception("Return data is not map, cannot parse");
    currentUser = User.fromJson(data as Map<String, dynamic>);
    localStorageService.prefs!
        .setString(AppStrings.user, currentUser!.toJson().toJSON());
    notifyListeners();
    return currentUser!;
  }

  User? getUserFromLocalStorage() {
    final dataJson = localStorageService.prefs!.getString(AppStrings.user);
    if (dataJson == null) return null;
    data = User.fromJson(json.decode(dataJson));
    currentUser = data;
    notifyListeners();
    return currentUser;
  }

  Future<void> toggleFavorite(String propertyId) async {
    if (currentUser == null) {
      final result = await _alertService.showConfirm(
          title: "Login",
          text: "You need to login to use this feature. Do you want to login?"
              .tr());
      if (result) _navigationService.navigateToLoginView();
      return;
    }
    final response =
        await post("${Api.toggleFavorite}/$propertyId", {"temp": 1});
    if (response.statusCode == 201) {
      return;
    }
  }

  Future<void> fetchProfile() async {
    try {
      get(Api.profile, forceRefresh: true);
      saveUser(data);
    } catch (error) {
      data = null;
      currentUser = null;
    } finally {
      notifyListeners();
    }
  }

  Future<void> refreshToken() async {
    get(
      Api.refreshToken,
    );
  }

  updateProfile({String? username, String? phone, File? image}) async {
    final formData = FormData.fromMap({
      if (username != null) "name": username,
      if (phone != null) "phone": phone,
      if (image != null)
        "profile_image": MultipartFile.fromFile(image.path,
            filename: image.path.split("/").last)
    });
    await patchWithFiles(Api.profile, formData);
  }
}
