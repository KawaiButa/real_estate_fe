import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custom_button_model.dart';

class CustomButton extends StackedView<CustomButtonModel> {
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.height = 50,
      this.width = 100,
      this.textColor = Colors.white,
      this.borderRadius = 0});
  final Function? onTap;
  final String text;
  final double height;
  final double width;
  final Color textColor;
  final double borderRadius;
  @override
  Widget builder(
    BuildContext context,
    CustomButtonModel viewModel,
    Widget? child,
  ) {
    return text
        .tr()
        .text
        .bold
        .lg
        .color(textColor)
        .makeCentered()
        .box
        .customRounded(BorderRadius.all(Radius.circular(borderRadius)))
        .width(width)
        .height(height)
        .make()
        .color(AppColors.primaryColor) // Use grey color when disabled
        .onTap(() {
      if (onTap != null) onTap!();
    });
  }

  @override
  CustomButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomButtonModel();
}
