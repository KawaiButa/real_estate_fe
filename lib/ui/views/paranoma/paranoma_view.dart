import 'dart:io';

import 'package:camera_360/camera_360.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:real_estate_fe/ui/views/paranoma/paranoma_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ParanomaView extends StackedView<ParanomaViewModel> {
  const ParanomaView({Key? key})
      : super(
          key: key,
        );

  @override
  ParanomaViewModel viewModelBuilder(BuildContext context) =>
      ParanomaViewModel();

  @override
  Widget builder(BuildContext context, ParanomaViewModel vm, Widget? child) {
    return Scaffold(
      body: Camera360(
        userDeviceVerticalCorrectDeg: 80.0,
        userCheckStitchingDuringCapture: true,
        userLoadingText: "Preparing panorama...",
        userHelperText: "Point the camera at the dot",
        userHelperTiltLeftText: "Tilt left",
        userHelperTiltRightText: "Tilt Right",
        userSelectedCameraKey: 2,
        cameraSelectorShow: true,
        cameraSelectorInfoPopUpShow: true,
        cameraSelectorInfoPopUpContent: const Text(
          "Select the camera with the widest viewing angle below.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffEFEFEF),
          ),
        ),
        cameraNotReadyContent: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "Camera not ready",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onCaptureEnded: (data) {
          vm.moveToVerticalCapture();
        },
        onCameraChanged: (cameraKey) {
          print("Camera changed ${cameraKey.toString()}");
        },
        // Callback function called when capture progress is changed
        onProgressChanged: (newProgressPercentage) {
          debugPrint("'Panorama360': Progress changed: $newProgressPercentage");
        },
      ),
    );
  }
}
