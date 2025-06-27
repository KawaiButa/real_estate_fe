import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/ui/views/search/search_viewmodel.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_list_view/custom_list_view.dart';
import 'package:real_estate_fe/ui/widgets/list_item/property_list_item/property_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/ui/widgets/common/property_card/property_card.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: VStack([
        HStack(
          [
            _buildLocationSelection(context, viewModel).expand(),
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
    return viewModel.isGridView
        ? CustomListView(
            dataSet: viewModel.properties,
            onRefresh: viewModel.performSearch,
            onLoading: () => viewModel.performSearch(initial: false),
            refreshController: viewModel.refreshController,
            padding: const EdgeInsets.all(8),
            canRefresh: true,
            canPullUp: true,
            isLoading: viewModel.busy(viewModel.properties),
            scrollController: viewModel.scrollController,
            itemBuilder: (context, index) {
              return PropertyCard(
                property: viewModel.properties[index],
                onTap: viewModel.navigateToPropertyDetail,
              );
            })
        : CustomListView(
            dataSet: viewModel.properties,
            onRefresh: viewModel.performSearch,
            onLoading: () => viewModel.performSearch(initial: false),
            refreshController: viewModel.refreshController,
            padding: const EdgeInsets.all(8),
            canRefresh: true,
            separator: 0,
            isLoading: viewModel.busy(viewModel.properties),
            canPullUp: true,
            scrollController: viewModel.scrollController,
            itemBuilder: (context, index) {
              return PropertyListItem(
                property: viewModel.properties[index],
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
