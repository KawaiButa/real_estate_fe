import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'guide_panorama_viewmodel.dart';

class GuidePanoramaView extends StackedView<GuidePanoramaViewModel> {
  const GuidePanoramaView({Key? key}) : super(key: key);

  @override
  GuidePanoramaViewModel viewModelBuilder(BuildContext context) =>
      GuidePanoramaViewModel();

  @override
  Widget builder(
    BuildContext context,
    GuidePanoramaViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      showAppBar: true,
      appBarColor: AppColors.primaryColor,
      title: "Guide Panorama".tr(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'How to capture a panorama:'.tr().text.titleLarge(context).make(),
            const SizedBox(height: 12),
            '1. Hold your device upright.\n'
                    '2. Align the red dot to the center.\n'
                    '3. Move slowly; capture is automatic when aligned.'
                .tr()
                .text
                .bodyLarge(context)
                .make(),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: viewModel.navigateToCapture,
                style: ButtonStyle(
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.primaryColor)),
                child: const Text('Start Panorama'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
