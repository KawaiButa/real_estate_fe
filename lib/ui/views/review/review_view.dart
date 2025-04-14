import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'review_viewmodel.dart';

class ReviewView extends StackedView<ReviewViewModel> {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ReviewView")),
      ),
    );
  }

  @override
  ReviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReviewViewModel();
}
