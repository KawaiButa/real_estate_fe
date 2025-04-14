import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/common/app_colors.dart';
import 'package:real_estate_fe/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'qr_scanner_dialog_model.dart';

const double _graphicSize = 60;

class QrScannerDialog extends StackedView<QrScannerDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const QrScannerDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QrScannerDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          children: [
            MobileScanner(
              controller: viewModel.controller,
            ),
            if (viewModel.image != null)
              Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Image.memory(
                    viewModel.image!,
                    width: 100,
                    height: 100,
                  ).box.border(color: Vx.white).make()),
            Positioned(
                right: 10,
                top: 10,
                child: const Icon(
                  Icons.close,
                  color: Vx.red700,
                ).onTap(() => Navigator.of(context).pop())),
            Visibility(
                visible: viewModel.code != null,
                child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: VStack([
                      HStack([
                        "YOUR CODE"
                            .tr()
                            .text
                            .lg
                            .center
                            .color(Vx.gray400)
                            .make()
                            .expand(),
                      ]),
                      HStack(
                        (viewModel.code ?? "")
                            .toUpperCase()
                            .split('')
                            .map((e) => e.text.center.bold.xl2.make().expand())
                            .toList(),
                        alignment: MainAxisAlignment.spaceAround,
                      ),
                      "Verify"
                          .tr() // Apply translation
                          .text // Convert to Text widget
                          .bold
                          .lg
                          .color(Colors.white) // Set text color
                          .makeCentered() // Center the text
                          .box
                          .rounded
                          .width(context.screenWidth) // Make button full width
                          .height(50)
                          .make() // Create the styled box widget
                          .color(AppColors
                              .primaryColor) // Use grey color when disabled
                          .onTap(viewModel.complete)
                    ]).box.color(Vx.white).make().p8().wFull(context)))
          ],
        ),
      ),
    );
  }

  @override
  QrScannerDialogModel viewModelBuilder(BuildContext context) =>
      QrScannerDialogModel();

  @override
  void onViewModelReady(QrScannerDialogModel viewModel) {
    viewModel.subscription = viewModel.controller.barcodes.listen((capture) {
      viewModel.updateCode(capture.barcodes.last.rawValue.toString());
      viewModel.updateImage(capture.image);
    });
    unawaited(viewModel.controller.start());
    super.onViewModelReady(viewModel);
  }
}
