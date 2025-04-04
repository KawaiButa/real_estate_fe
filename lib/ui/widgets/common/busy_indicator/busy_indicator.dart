import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'busy_indicator_model.dart';

class BusyIndicator extends StackedView<BusyIndicatorModel> {
  const BusyIndicator({this.color, super.key});
  final Color? color;
  @override
  Widget builder(
    BuildContext context,
    BusyIndicatorModel viewModel,
    Widget? child,
  ) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? context.theme.textTheme.bodyLarge!.color!,
        ),
      ),
    );
  }

  @override
  BusyIndicatorModel viewModelBuilder(
    BuildContext context,
  ) =>
      BusyIndicatorModel();
}
