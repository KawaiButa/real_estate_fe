import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/ui/views/favorite/favorite_viewmodel.dart';
import 'package:real_estate_fe/ui/views/guest/guest_view.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_list_view/custom_list_view.dart';
import 'package:real_estate_fe/ui/widgets/list_item/property_list_item/property_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/ui/widgets/common/property_card/property_card.dart';
import 'package:velocity_x/velocity_x.dart';

class FavoriteView extends StackedView<FavoriteViewModel> {
  const FavoriteView({
    super.key,
    this.selectedPropertyType,
    this.query,
  });
  final PropertyType? selectedPropertyType;
  final String? query;
  @override
  Widget builder(
      BuildContext context, FavoriteViewModel viewModel, Widget? child) {
    return BasePage(
        body: viewModel.isLoggedIn
            ? VStack([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                          viewModel.isGridView ? Icons.list : Icons.grid_view),
                      onPressed: viewModel.toggleView,
                    ),
                  ],
                ).px8(),
                _buildSearchResults(viewModel).expand()
              ])
            : const GuestView());
  }

  Widget _buildSearchResults(FavoriteViewModel viewModel) {
    if (viewModel.busy(viewModel.favoritesProperty)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.favoritesProperty.isEmpty) {
      return Center(
        child: Text(
          'Không tìm thấy kết quả phù hợp',
          style: AppTextStyle.h3TitleTextStyle(),
        ),
      );
    }

    return viewModel.isGridView
        ? GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: viewModel.favoritesProperty.length,
            itemBuilder: (context, index) => PropertyCard(
              property: viewModel.favoritesProperty[index],
              onTap: (property) {},
            ),
          )
        : CustomListView(
            canRefresh: true,
            onRefresh: () => viewModel.fetchFavoredProperty(initial: true),
            hasError: viewModel.hasError,
            separator: 4,
            dataSet: viewModel.favoritesProperty,
            itemBuilder: (context, index) => PropertyListItem(
              property: viewModel.favoritesProperty[index],
              onTap: (property) {},
            ),
          ).px12();
  }

  @override
  FavoriteViewModel viewModelBuilder(BuildContext context) =>
      FavoriteViewModel();
  @override
  void onViewModelReady(FavoriteViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
