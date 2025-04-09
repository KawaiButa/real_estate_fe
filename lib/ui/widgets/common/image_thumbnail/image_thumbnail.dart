import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'image_thumbnail_model.dart';

class ImageThumbnail extends StackedView<ImageThumbnailModel> {
  const ImageThumbnail(this.image, {this.onRemove, super.key});
  final Function? onRemove;
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
          width: 200,
          height: 200,
          image,
          fit: BoxFit.cover,
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
