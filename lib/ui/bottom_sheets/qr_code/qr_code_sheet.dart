import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/common/app_colors.dart';
import 'package:real_estate_fe/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'qr_code_sheet_model.dart';

class QrCodeSheet extends StackedView<QrCodeSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const QrCodeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QrCodeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: VStack(
        [
          if (viewModel.code != null)
            Center(
              child: Text(
                viewModel.formatTime(viewModel.remainingTime),
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          if (viewModel.code != null)
            QrImageView(
              data: viewModel.code!,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
              embeddedImage: const AssetImage('assets/images/logo.png'),
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(80, 80),
              ),
            ),
          if (viewModel.isBusy) const CircularProgressIndicator(),
          "Close"
              .tr()
              .text
              .bold
              .lg
              .color(Vx.white)
              .makeCentered()
              .box
              .color(AppColors.primaryColor)
              .rounded
              .width(context.screenWidth)
              .height(50)
              .make()
              .pOnly(top: 8)
              .onTap(() => Navigator.of(context).pop())
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  @override
  void onViewModelReady(QrCodeSheetModel viewModel) {
    if (request.data != null) viewModel.initialise(request.data);
    super.onViewModelReady(viewModel);
  }

  @override
  QrCodeSheetModel viewModelBuilder(BuildContext context) => QrCodeSheetModel();
}
