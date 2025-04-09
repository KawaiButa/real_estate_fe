import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/ui/widgets/common/location_card/location_card.dart';
import 'package:real_estate_fe/ui/widgets/common/news_card/news_card.dart';
import 'package:real_estate_fe/ui/widgets/common/property_card/property_card.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.initialise();
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          _buildBannerCarousel(viewModel),
          _buildFilterSection(viewModel),
          _buildFeaturedProperties(viewModel),
          _buildSectionHeader("new_posts".tr()),
          if (viewModel.properties != null)
            ...viewModel.properties!
                .map((property) => PropertyCard(
                      property: property,
                      onTap: viewModel.navigateToPropertyDetail,
                    ))
                .toList(),
          _buildSectionHeader('real_estate_news'.tr()),
          _buildNewsGrid(viewModel),
        ],
      ),
    );
  }

  Widget _buildBannerCarousel(HomeViewModel viewModel) {
    if (viewModel.banners == null) return const SizedBox.shrink();
    return VxSwiper.builder(
      aspectRatio: 20 / 9,
      autoPlay: true,
      enlargeCenterPage: true,
      itemCount: viewModel.banners!.length,
      itemBuilder: (context, index) {
        final banner = viewModel.banners![index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(banner.url),
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              // Gradient overlay for text visibility
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
              // Banner text
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banner.title,
                      style: AppTextStyle.h2TitleTextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      banner.content,
                      style: AppTextStyle.h5TitleTextStyle(
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ).h(200);
  }

  Widget _buildFilterSection(HomeViewModel viewModel) {
    if (viewModel.busy(viewModel.locations)) {
      return const CircularProgressIndicator();
    }
    if (viewModel.locations == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: AppColors.faintBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: null,
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: AppColors.primaryColor),
                      items: [
                        DropdownMenuItem(
                            value: null,
                            child: Text('all'.tr(),
                                style: AppTextStyle.h4TitleTextStyle())),
                        ...((viewModel.propertyTypes ?? []).map(
                          (e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name.tr(),
                                  style: AppTextStyle.h4TitleTextStyle())),
                        ))
                      ],
                      onChanged: viewModel.changeLocationPostCountType,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "discover_by_location".tr(),
            style: AppTextStyle.h3TitleTextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          // Location cards
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.locations!.length,
              itemBuilder: (context, index) {
                return LocationCard(
                  location: viewModel.locations![index],
                  onTap: (location) {
                    // Handle location tap
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Filter chips
          Text(
            "filter_by_type".tr(),
            style: AppTextStyle.h4TitleTextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Visibility(
                visible: !viewModel.busy(viewModel.propertyTypes),
                child: viewModel.propertyTypes != null
                    ? HStack(
                        (viewModel.propertyTypes)!
                            .map((propertyType) => _buildFilterChip(
                                propertyType.name.tr(),
                                () => viewModel.filterByType(propertyType)))
                            .toList(),
                      )
                    : const SizedBox.shrink()),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, Function onTap) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(label, style: AppTextStyle.h5TitleTextStyle())
          .onTap(() => onTap()),
    );
  }

  Widget _buildFeaturedProperties(HomeViewModel viewModel) {
    final featuredProperties = (viewModel.properties ?? []).toList();

    if (featuredProperties.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("most_search".tr()),
        SizedBox(
          height: 320,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: featuredProperties.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 280,
                child: PropertyCard(
                  property: featuredProperties[index],
                  onTap: viewModel.navigateToPropertyDetail,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.h3TitleTextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "all".tr(),
              style: AppTextStyle.h4TitleTextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsGrid(HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: viewModel.newsArticles.length,
        itemBuilder: (context, index) {
          final article = viewModel.newsArticles[index];
          return NewsCard(
            article: article,
            onTap: (article) {},
          );
        },
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
