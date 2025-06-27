import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/ui/widgets/common/expandable_button/expandable_button.dart';
import 'package:real_estate_fe/ui/widgets/common/tourview_room_button/tourview_room_button.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'new_tourview_viewmodel.dart';

class NewTourviewView extends StackedView<NewTourviewViewModel> {
  const NewTourviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NewTourviewViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      showAppBar: true,
      title: "New Tourview",
      appBarColor: AppColors.primaryColor,
      body: Stack(children: [
        ListView.builder(
          itemCount: viewModel.rooms.length + 1,
          itemBuilder: (context, index) {
            if (index == viewModel.rooms.length) {
              return ExpandableButton(onPressed: viewModel.handleAddRoom);
            }
            final room = viewModel.rooms[index];
            return TourviewRoomButton(room);
          },
        ).p8(),
      ]),
    );
  }

  @override
  NewTourviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NewTourviewViewModel();

  @override
  void onViewModelReady(NewTourviewViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
