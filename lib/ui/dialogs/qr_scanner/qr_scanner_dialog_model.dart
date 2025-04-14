import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QrScannerDialogModel extends BaseViewModel {
  final MobileScannerController controller = MobileScannerController();
  final _dialogService = locator<DialogService>();
  StreamSubscription<Object?>? subscription;
  String? code;
  Uint8List? image;
  void updateCode(String string) {
    code = string;
    notifyListeners();
  }

  void updateImage(Uint8List? value) {
    image = value;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(subscription?.cancel());
    subscription = null;
    super.dispose();
    controller.dispose();
  }

  void complete() {
    _dialogService.completeDialog(DialogResponse(confirmed: true, data: code));
  }
}
