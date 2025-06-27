import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'image_upload_button_model.dart';

class ImageUploadButton extends StackedView<ImageUploadButtonModel> {
  const ImageUploadButton(this.onTap, {super.key});
  final Function? onTap;
  @override
  Widget builder(
    BuildContext context,
    ImageUploadButtonModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => onTap == null ? null : onTap!(),
      child: VxBox(
        child: const Icon(Icons.add, color: Vx.gray600, size: 30),
      ).size(100, 100).border(color: Vx.gray400).rounded.make().p8(),
    );
  }

  @override
  ImageUploadButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      ImageUploadButtonModel();
}
