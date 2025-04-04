import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:real_estate_fe/constants/app_images.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/ui/widgets/common/busy_indicator/busy_indicator.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'full_image_preview_viewmodel.dart';

class FullImagePreviewView extends StackedView<FullImagePreviewViewModel> {
  const FullImagePreviewView(
    this.imageUrl, {
    this.boxFit,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? boxFit;

  @override
  Widget builder(
    BuildContext context,
    FullImagePreviewViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      backgroundColor: Colors.black.withValues(alpha: 0.2),
      body: SafeArea(
        child: Column(
          children: [
            //header
            HStack(
              [
                //
                const Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ).box.p4.roundedFull.red500.make().onInkTap(() {
                  Navigator.pop(context);
                }),
                UiSpacer.expandedSpace(),
              ],
            ).p20(),
            //
            PinchZoom(
              maxScale: 5,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, imageUrl, _) => Image.asset(
                  AppImages.appLogo,
                  fit: boxFit ?? BoxFit.cover,
                ),
                fit: boxFit ?? BoxFit.cover,
                progressIndicatorBuilder: (context, imageURL, progress) =>
                    const BusyIndicator().centered(),
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }

  @override
  FullImagePreviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FullImagePreviewViewModel();
}
