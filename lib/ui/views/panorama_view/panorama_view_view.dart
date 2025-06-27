import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';
import 'panorama_view_viewmodel.dart';

class PanoramaViewView extends StackedView<PanoramaViewViewModel> {
  const PanoramaViewView({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget builder(
    BuildContext context,
    PanoramaViewViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
        showAppBar: true,
        appBarColor: AppColors.primaryColor,
        title: "Tourview".tr(),
        body: Center(
          child: PanoramaViewer(
            sensorControl: SensorControl.orientation,
            child: Image.network(
                'https://raw.githubusercontent.com/ShreyaAmbaliya/panorama_viewer_plus/main/example/assets/test.jpg'),
          ),
        ));
  }

  @override
  PanoramaViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PanoramaViewViewModel();
}
