import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  Future<void> loginWithEmail() async {
    try {
      setBusy(true);
      _alertService.showLoading();
      final user = await _authService.signInWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (user != null) {
        _alertService.stopLoading();
        _navigationService.clearStackAndShow(Routes.welcomeView);
      }
    } catch (e) {
      _alertService.stopLoading();
      _alertService.error(title: "Login error".tr(), text: e.toString());
      debugPrint('Login error: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      setBusy(true);
      await _authService.signInWithGoogle();
      // Navigate to home after successful login
    } catch (e) {
      // Handle error
      print('Google sign in error: $e');
    } finally {
      setBusy(false);
    }
  }

  void navigateToRegister() {
    _navigationService.navigateTo(Routes.registerView);
  }
}
