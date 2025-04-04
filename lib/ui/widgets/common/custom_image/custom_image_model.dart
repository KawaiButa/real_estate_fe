// ignore: implementation_imports
import 'package:flutter/src/painting/box_fit.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomImageModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future<void> zoomImage(
      {required String imageUrl, required BoxFit boxFit}) async {
    _navigationService.navigateToFullImagePreviewView(
        imageUrl: imageUrl, boxFit: boxFit);
  }
}
