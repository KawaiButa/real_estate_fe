import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpandableButton extends StatelessWidget {
  const ExpandableButton({super.key, this.onPressed});
  final Function? onPressed;
  @override
  Widget build(
    BuildContext context,
  ) {
    return VxBox(
            child: "Add new room"
                .tr()
                .text
                .xl3
                .color(AppColors.primaryColor)
                .makeCentered())
        .rounded
        .border(color: AppColors.primaryColor, width: 2)
        .width(double.infinity)
        .height(200)
        .make()
        .onTap(() {
      if (onPressed != null) onPressed!();
    });
  }
}
