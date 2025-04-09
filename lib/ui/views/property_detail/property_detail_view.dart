// property_detail_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/review.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/ui/views/property_detail/property_detail_viewmodel.dart';

class PropertyDetailView extends StackedView<PropertyDetailViewModel> {
  final Property property;
  final bool isOwner;
  const PropertyDetailView({
    Key? key,
    required this.property,
    this.isOwner = false,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, PropertyDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, viewModel),
          _buildBody(context, viewModel),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(
      BuildContext context, PropertyDetailViewModel viewModel) {
    return SliverAppBar(
      expandedHeight: 275,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildImageCarousel(context, viewModel),
      ),
      actions: [
        IconButton(
          icon: Icon(
            viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: viewModel.toggleFavorite,
        ).p8(),
      ],
    );
  }

  Widget _buildImageCarousel(
      BuildContext context, PropertyDetailViewModel viewModel) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: viewModel.property!.images.length,
          itemBuilder: (context, index, _) => CachedNetworkImage(
            imageUrl: viewModel.property!.images[index].url,
            fit: BoxFit.cover,
            placeholder: (context, url) => VxBox().color(Vx.gray200).make(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            onPageChanged: (index, _) => viewModel.setImageIndex(index),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: VxBox(
            child:
                "${viewModel.currentImageIndex + 1}/${viewModel.property!.images.length}"
                    .text
                    .white
                    .make()
                    .p8(),
          ).color(Colors.black54).rounded.make(),
        ),
      ],
    ).onInkTap(() => viewModel.openFullScreenGallery(context));
  }

  Widget _buildBody(BuildContext context, PropertyDetailViewModel viewModel) {
    return SliverToBoxAdapter(
      child: VStack([
        _buildPriceSection(viewModel),
        _buildDetailsSection(viewModel),
        if (isOwner)
          "Edit property"
              .tr() // Apply translation
              .text // Convert to Text widget
              .bold
              .lg
              .color(Colors.white) // Set text color
              .makeCentered() // Center the text
              .box
              .color(AppColors.primaryColor) // Use grey color when disabled
              .rounded
              .width(context.screenWidth) // Make button full width
              .height(50)
              .make() // Create the styled box widget
              .onTap(viewModel.editProperty),
        if (isOwner)
          "Delete property"
              .tr()
              .text
              .bold
              .lg
              .color(Vx.white)
              .makeCentered()
              .box
              .color(AppColors.primaryColor)
              .rounded
              .width(context.screenWidth)
              .height(50)
              .make()
              .pOnly(top: 8)
              .onTap(viewModel.deleteProperty),
        _buildDescriptionSection(viewModel),
        _buildAddressSection(viewModel),
        _buildOwnerSection(viewModel),
        _buildReviewSection(context, viewModel),
      ]).p16(),
    );
  }

  Widget _buildReviewHeader(
      BuildContext context, PropertyDetailViewModel viewModel) {
    final property = viewModel.property!;
    final avgRating = property.averageRating ?? 0;
    final totalReviews = property.totalReviewCount ?? 0;

    return HStack([
      // Average rating
      VStack([
        "$avgRating".text.xl4.bold.make(),
        "Average Rating".text.gray600.make(),
      ]),
      UiSpacer.horizontalSpace(space: 16),

      // Divider line or vertical space
      Container(width: 1, height: 40, color: Vx.gray200),
      UiSpacer.horizontalSpace(space: 16),

      // Total reviews count
      VStack([
        "$totalReviews".text.xl4.bold.make(),
        "Total Reviews".text.gray600.make(),
      ]).expand(),
    ]);
  }

  Widget _buildReviewItem(BuildContext context, Review review) {
    // A basic layout for the review item:
    return VStack([
      // Rating
      HStack([
        // Star icon or rating UI
        const Icon(Icons.star, color: Colors.amber),
        "${review.rating}".text.semiBold.make(),
      ]),

      // Comment text
      review.reviewText.text.make().py4(),

      // If there are images, show them in a grid
      if (review.media.isNotEmpty)
        GridView.builder(
          itemCount: review.media.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, mediaIndex) {
            final image = review.media[mediaIndex];
            return CachedNetworkImage(
              imageUrl: image.mediaUrl,
              fit: BoxFit.cover,
              placeholder: (ctx, _) => VxBox().color(Vx.gray200).make(),
              errorWidget: (ctx, _, __) => const Icon(Icons.error),
            );
          },
        ).py4(),

      // Review creation date, etc.
      // "${review.createdAt}".text.gray500.sm.make(),
    ]);
  }

  Widget _buildAddReviewField(
    BuildContext context,
    PropertyDetailViewModel viewModel,
  ) {
    // We'll assume the viewModel has a TextEditingController for the new review comment
    return VxBox(
      child: VStack([
        "Write a Review".text.xl.semiBold.make().py8(),
        Visibility(visible: viewModel.canReview, child: HStack([])),

        TextField(
          controller: viewModel.newReviewController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: "Share your experience...",
            border: OutlineInputBorder(),
          ),
        ),
        UiSpacer.verticalSpace(),

        // Submit button
        ElevatedButton(
          onPressed: () async {
            final success = await viewModel.submitReview();
            if (!success) {
              // The ViewModel can inform you if the user is not authorized.
              // If unauthorized, show a dialog:
              // _showAuthorizationDialog(context, viewModel);
            } else {
              // If success, maybe clear text field or fetch updated reviews
              viewModel.newReviewController.clear();
            }
          },
          child: "Submit".text.make(),
        )
      ]),
    ).white.rounded.shadowXs.p16.make();
  }

  Widget _buildReviewSection(
      BuildContext context, PropertyDetailViewModel viewModel) {
    final property = viewModel.property;
    if (property?.reviews == null || property!.reviews.isEmpty) {
      // If no reviews, show an empty-state or a "Be the first to write a review" message
      return VStack([
        "Reviews".text.xl2.semiBold.make().py8(),
        "No reviews yet. Be the first to write one!".text.gray600.make(),
        UiSpacer.verticalSpace(space: 16),
        Visibility(
            visible:
                viewModel.canReview && !viewModel.busy(viewModel.canReview),
            child: _buildAddReviewField(context, viewModel)),
      ]).py12();
    }

    return VStack([
      _buildReviewHeader(context, viewModel).pOnly(bottom: 12),

      ListView.builder(
        itemCount: property.reviews.length < 3 ? property.reviews.length : 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final review = property.reviews[index];
          return _buildReviewItem(context, review).pOnly(bottom: 16);
        },
      ),

      // “Read More” button to go to the full review page (if there are more than 3 reviews)
      if (property.reviews.length > 3)
        "Read more"
            .text
            .blue600
            .bold
            .make()
            .onTap(() => viewModel.goToReviewPage()),

      UiSpacer.verticalSpace(space: 16),

      // 4) TextInput for adding new review
      _buildAddReviewField(context, viewModel),
    ]).py12();
  }

  Widget _buildPriceSection(PropertyDetailViewModel viewModel) {
    return VStack([
      "Price".text.gray600.make(),
      viewModel.property!.price
          .toString()
          .numCurrencyWithLocale(locale: "vi-VN")
          .text
          .xl4
          .bold
          .color(Vx.blue800)
          .make(),
    ]).py12();
  }

  Widget _buildDetailsSection(PropertyDetailViewModel viewModel) {
    return VxBox(
      child: VStack([
        "Property Details".text.xl2.semiBold.make().py8(),
        HStack(
          [
            _buildDetailItem("${viewModel.property!.bedrooms}", "Bedrooms"),
            _buildDetailItem("${viewModel.property!.bathrooms}", "Bathrooms"),
            _buildDetailItem(
                viewModel.property!.sqm?.toStringAsFixed(0) ?? 'N/A', "SQM"),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        )
      ]),
    ).white.rounded.shadowXs.p16.width(double.infinity).make().py12();
  }

  Widget _buildDetailItem(String value, String label) {
    return VStack(
      [
        value.text.xl.bold.make(),
        label.text.gray600.make(),
      ],
      alignment: MainAxisAlignment.center,
    );
  }

  Widget _buildDescriptionSection(PropertyDetailViewModel viewModel) {
    return VxBox(
      child: VStack([
        "Description".text.xl2.semiBold.make().py2(),
        Html(
          data: viewModel.property!.description,
          style: {
            "body": Style(margin: Margins.zero),
            "p": Style(fontSize: FontSize(16)),
          },
        ),
      ]),
    ).white.rounded.shadowXs.p16.make().py12();
  }

  Widget _buildAddressSection(PropertyDetailViewModel viewModel) {
    return VxBox(
      child: VStack([
        "Address".text.xl2.semiBold.make().py8(),
        viewModel.property!.address.street.text.lg.make(),
        HStack([
          "${viewModel.property!.address.city}, ${viewModel.property!.address.postalCode ?? ''}"
              .text
              .gray600
              .make(),
          const Icon(Icons.map, size: 20).px8(),
          "View on Map".text.blue600.bold.make(),
        ]).py8().onInkTap(() => viewModel.launchGoogleMaps(viewModel)),
      ]),
    ).white.rounded.shadowXs.p16.width(double.infinity).make().py12();
  }

  Widget _buildOwnerSection(PropertyDetailViewModel viewModel) {
    if (viewModel.property?.owner == null) return const SizedBox.shrink();
    return VxBox(
      child: VStack([
        "Owner".text.xl2.semiBold.make().py8(),
        HStack([
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(
                viewModel.property!.owner!.profileImage?.url ?? ""),
          ),
          VStack([
            viewModel.property!.owner!.name.text.lg.bold.make(),
            "Member since ${viewModel.property!.owner!.partnerRegistration?.createdAt}"
                .text
                .gray600
                .make(),
          ]).px12().expand(),
        ]),
        HStack([
          _buildActionButton(Icons.phone, "Call", Colors.green,
              () => viewModel.launchPhoneCall(viewModel)),
          UiSpacer.hSpace(),
          _buildActionButton(
              Icons.message, "Chat", Vx.blue600, () => viewModel.openChat()),
        ]).py16(),
      ]),
    ).white.rounded.shadowXs.p16.make().py12();
  }

  Widget _buildActionButton(
      IconData icon, String label, Color color, VoidCallback onTap) {
    return VStack([
      Icon(icon, color: color).iconSize(30),
      label.text.color(color).semiBold.make(),
    ])
        .centered()
        .onInkTap(onTap)
        .p8()
        .box
        .rounded
        .border(color: color)
        .make()
        .expand();
  }

  @override
  PropertyDetailViewModel viewModelBuilder(BuildContext context) =>
      PropertyDetailViewModel(property: property);
}
