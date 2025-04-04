import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';

import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      showAppBar: true,
      appBarColor: AppColors.primaryColor,
      isIconNotification: true,
      isIconMessage: true,
      isSearch: true,
      isLoading: viewModel.isBusy,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.index,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: "home".tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search), label: "search".tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add_circle_outline), label: 'post'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border), label: 'favorite'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline), label: "profile".tr()),
        ],
        onTap: viewModel.setIndex,
      ),
      body: viewModel.getViewForIndex(viewModel.index),
    );
  }

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
