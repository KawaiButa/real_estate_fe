// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/filter/filter_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/qr_code/qr_code_sheet.dart';

enum BottomSheetType {
  notice,
  filter,
  qrCode,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.filter: (context, request, completer) =>
        FilterSheet(request: request, completer: completer),
    BottomSheetType.qrCode: (context, request, completer) =>
        QrCodeSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
