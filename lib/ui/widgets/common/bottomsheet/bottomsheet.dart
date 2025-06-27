import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bottomsheet_model.dart';

class Bottomsheet extends StackedView<BottomsheetModel> {
  const Bottomsheet({super.key});

  @override
  Widget builder(
    BuildContext context,
    BottomsheetModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  BottomsheetModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomsheetModel();
}
