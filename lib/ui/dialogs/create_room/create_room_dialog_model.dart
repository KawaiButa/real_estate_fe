import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/utils/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateRoomDialogModel extends BaseViewModel {
  final List<File> _images = [];
  List<File> get images => _images;
  final ImagePicker _imagePicker = ImagePicker();
  final _dialogService = locator<DialogService>();
  TextEditingController controller = TextEditingController();
  Future<void> pickImages() async {
    final pickedFiles = await _imagePicker.pickMultiImage(
      maxWidth: 100,
      maxHeight: 100,
    );
    _images.addAll(pickedFiles.map((e) => File(e.path)));
    notifyListeners();
  }

  onComplete() {
    if (controller.text.isEmptyOrNull) {
      VxToast.show(StackedService.navigatorKey!.currentState!.context,
          msg: "Please fill the room name".tr());
      return;
    }
    _dialogService.completeDialog(DialogResponse(
        confirmed: true, data: {"title": controller.text, "images": _images}));
  }
}
