import 'package:camera/camera.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerticalCaptureViewModel extends BaseViewModel {
  CameraController? controller;
  bool isUpCaptured = false;
  final _navigationService = locator<NavigationService>();
  Future<void> init() async {
    final cams = await availableCameras();
    final back =
        cams.firstWhere((c) => c.lensDirection == CameraLensDirection.back);
    controller = CameraController(back, ResolutionPreset.medium);
    await controller!.initialize();
    notifyListeners();
  }

  Future<void> capture() async {
    final file = await controller!.takePicture();
    if (!isUpCaptured) {
      isUpCaptured = true;
    } else {
      _navigationService.back();
    }
    notifyListeners();
  }
}
