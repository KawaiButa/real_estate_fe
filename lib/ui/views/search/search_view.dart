import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/ui/views/search/search_viewmodel.dart';
import 'package:real_estate_fe/ui/widgets/list_item/property_list_item/property_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/ui/widgets/common/property_card/property_card.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_map/flutter_map.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({
    super.key,
    this.selectedPropertyType,
    this.query,
  });
  final PropertyType? selectedPropertyType;
  final String? query;
  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      // Added Scaffold here
      body: VStack([
        HStack(
          [
            _buildLocationSelection(context, viewModel)
                .expand(), // Location selection UI
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: viewModel.showFilterSheet,
                  child: Row(
                    children: [
                      const Icon(Icons.filter_list).pOnly(right: 4),
                      Text(
                        "Filter".tr(),
                        style: AppTextStyle.h4TitleTextStyle(),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon:
                      Icon(viewModel.isGridView ? Icons.list : Icons.grid_view),
                  onPressed: viewModel.toggleView,
                ),
              ],
            ).px8(),
          ],
        ),
        _buildSearchResults(viewModel).expand(),
      ]),
    );
  }

  // Location selection section
  Widget _buildLocationSelection(
      BuildContext context, SearchViewModel viewModel) {
    return HStack(
      [
        Icon(Icons.location_on_outlined, color: AppColors.primaryColor),
        if (viewModel.selectedLocation == null)
          "Select location".tr().text.make()
        else
          (viewModel.selectedLocation!.address ?? "").text.make()
      ],
    )
        .onTap(viewModel.showMapSheet)
        .box
        .clip(Clip.antiAlias)
        .make()
        .pOnly(right: 20, left: 10);
  }

  Widget _buildSearchResults(SearchViewModel viewModel) {
    if (viewModel.busy(viewModel.properties)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.properties != null && viewModel.properties!.isEmpty) {
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
            controller: viewModel.scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: viewModel.properties!.length,
            itemBuilder: (context, index) {
              if (index == viewModel.properties!.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return PropertyCard(
                property: viewModel.properties![index],
                onTap: viewModel.navigateToPropertyDetail,
              );
            })
        : ListView.builder(
            padding: const EdgeInsets.all(8),
            controller: viewModel.scrollController,
            itemCount: viewModel.properties!.length,
            itemBuilder: (context, index) {
              if (index == viewModel.properties!.length) {
                return const Padding(
                  // Add padding for the loading indicator in list view
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return PropertyListItem(
                property: viewModel.properties![index],
                onTap: viewModel.navigateToPropertyDetail,
              );
            });
  }

  @override
  SearchViewModel viewModelBuilder(BuildContext context) => SearchViewModel();
  @override
  void onViewModelReady(SearchViewModel viewModel) {
    viewModel.initialise(type: selectedPropertyType, query: query);
    super.onViewModelReady(viewModel);
  }
}
