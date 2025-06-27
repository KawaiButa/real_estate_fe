import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'guide_vertical_viewmodel.dart';

class GuideVerticalView extends StackedView<GuideVerticalViewModel> {
  const GuideVerticalView({Key? key}) : super(key: key);

  @override
  GuideVerticalViewModel viewModelBuilder(BuildContext context) =>
      GuideVerticalViewModel();

  @override
  Widget builder(
    BuildContext context,
    GuideVerticalViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      showAppBar: true,
      title: 'Vertical Capture Guide'.tr(),
      appBarColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Capture Up and Down Images:'.tr().text.labelMedium(context).make(),
            const SizedBox(height: 12),
            '1. Tilt upwards and press capture.\n'
                    '2. Tilt downwards and press capture again.'
                .tr()
                .text
                .bodySmall(context)
                .make(),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: viewModel.navigateToVerticalCapture,
                child: const Text('Start Vertical Capture'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
