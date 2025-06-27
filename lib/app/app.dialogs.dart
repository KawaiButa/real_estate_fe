// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/create_room/create_room_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/map/map_dialog.dart';
import '../ui/dialogs/qr_scanner/qr_scanner_dialog.dart';

enum DialogType {
  infoAlert,
  map,
  qrScanner,
  createRoom,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.map: (context, request, completer) =>
        MapDialog(request: request, completer: completer),
    DialogType.qrScanner: (context, request, completer) =>
        QrScannerDialog(request: request, completer: completer),
    DialogType.createRoom: (context, request, completer) =>
        CreateRoomDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
