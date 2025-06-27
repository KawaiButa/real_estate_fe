import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_images.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'image_thumbnail_model.dart';

class ImageThumbnail extends StackedView<ImageThumbnailModel> {
  const ImageThumbnail(this.image,
      {this.width = 200, this.height = 200, this.onRemove, super.key});
  final Function? onRemove;
  final double width;
  final double height;
  final File image;
  @override
  Widget builder(
    BuildContext context,
    ImageThumbnailModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Image.file(
          image,
          errorBuilder: (context, imageUrl, error) {
            return Image.asset(
              AppImages.appLogo,
              fit: BoxFit.cover,
            );
          },
          fit: BoxFit.fill,
        ),
        Positioned(
            top: -10,
            right: -10,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Vx.red800,
                size: 20,
              ),
              onPressed: () {
                if (onRemove != null) onRemove!();
              },
            )),
      ],
    ).cornerRadius(5);
  }

  @override
  ImageThumbnailModel viewModelBuilder(
    BuildContext context,
  ) =>
      ImageThumbnailModel();
}
