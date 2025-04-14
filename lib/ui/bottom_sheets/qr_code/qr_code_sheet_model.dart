import 'dart:async';

import 'package:dio/dio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QrCodeSheetModel extends BaseViewModel {
  String? code;
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  int remainingTime = 15 * 60; // 15 minutes in seconds
  Timer? _timer;
  initialise(String propertyId) async {
    try {
      setBusy(true);
      final token = await _authService.getAuthBearerToken();
      final response = await Dio().get("${Api.baseUrl}${Api.otp(propertyId)}",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        code = response.data["otp"];
        _startTimer();
      }
    } catch (error) {
      setError("Error when fetching QR code".tr());
    } finally {
      setBusy(false);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
        _navigationService.back();
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
