import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/ui/widgets/list_item/property_list_item/property_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'property_viewmodel.dart';

class PropertyView extends StackedView<PropertyViewModel> {
  const PropertyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PropertyViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      title: "Property Management".tr(),
      showAppBar: true,
      appBarColor: AppColors.primaryColor,
      body: Stack(
        children: [
          buildContent(context, viewModel),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: "Create property"
                  .tr() // Apply translation
                  .text // Convert to Text widget
                  .bold
                  .lg
                  .color(Colors.white) // Set text color
                  .makeCentered() // Center the text
                  .px8()
                  .box
                  .p8
                  .rounded
                  .width(context.screenWidth) // Make button full width
                  .height(50)
                  .make() // Create the styled box widget
                  .px8()
                  .color(AppColors.primaryColor) // Use grey color when disabled
                  .onTap(viewModel.navigateToPropertyCreate))
        ],
      ),
    );
  }

  buildContent(BuildContext context, PropertyViewModel viewModel) {
    if (viewModel.busy(viewModel.user)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.user != null && viewModel.user!.properties.isEmpty) {
      return Center(
        child: Text(
          "You don't have any registered property.".tr(),
          style: AppTextStyle.h3TitleTextStyle(),
        ),
      );
    }

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        controller: viewModel.scrollController,
        itemCount: viewModel.user!.properties.length,
        itemBuilder: (context, index) {
          if (index == viewModel.user!.properties.length) {
            return const Padding(
              // Add padding for the loading indicator in list view
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return PropertyListItem(
            property: viewModel.user!.properties[index],
            onTap: viewModel.navigateToPropertyDetail,
          );
        });
  }

  @override
  void onViewModelReady(PropertyViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }

  @override
  PropertyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PropertyViewModel();
}
