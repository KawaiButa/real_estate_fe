import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_images.dart';
import 'package:real_estate_fe/ui/widgets/common/busy_indicator/busy_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custom_image_model.dart';

class CustomImage extends StackedView<CustomImageModel> {
  const CustomImage({
    required this.imageUrl,
    this.height = Vx.dp40,
    this.errorBuilder,
    this.width,
    this.boxFit,
    this.canZoom = false,
    Key? key,
  }) : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final Widget Function(BuildContext context, String url, Object data)?
      errorBuilder;
  final bool canZoom;

  @override
  Widget builder(
    BuildContext context,
    CustomImageModel viewModel,
    Widget? child,
  ) {
    String displayImage =
        (imageUrl?.isNotEmpty ?? false) ? imageUrl! : AppImages.appLogo;

    return CachedNetworkImage(
      imageUrl: displayImage,
      errorWidget: errorBuilder != null
          ? errorBuilder!
          : (context, imageUrl, _) => Image.asset(
                AppImages.appLogo,
                fit: boxFit ?? BoxFit.cover,
              ),
      fit: boxFit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, imageURL, progress) =>
          const BusyIndicator().centered(),
    ).h(height ?? Vx.dp48).w(width ?? context.percentWidth).onInkTap(canZoom
        ? () {
            if (canZoom) {
              viewModel.zoomImage(
                imageUrl: displayImage,
                boxFit: boxFit ?? BoxFit.cover,
              );
            }
          }
        : null);
  }

  @override
  CustomImageModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomImageModel();
}
