// property_detail_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/ui/views/property_detail/property_detail_viewmodel.dart';

class PropertyDetailView extends StackedView<PropertyDetailViewModel> {
  final Property property;

  const PropertyDetailView({Key? key, required this.property})
      : super(key: key);

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
      expandedHeight: 300,
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
          ).color(Colors.black54).roundedLg.make(),
        ),
      ],
    ).onInkTap(() => viewModel.openFullScreenGallery(context));
  }

  Widget _buildBody(BuildContext context, PropertyDetailViewModel viewModel) {
    return SliverToBoxAdapter(
      child: VStack([
        _buildPriceSection(viewModel),
        _buildDetailsSection(viewModel),
        _buildDescriptionSection(viewModel),
        _buildAddressSection(viewModel),
        _buildOwnerSection(viewModel),
      ]).p16(),
    );
  }

  Widget _buildPriceSection(PropertyDetailViewModel viewModel) {
    return VStack([
      viewModel.property!.price
          .toInt()
          .toString()
          .numCurrency
          .text
          .xl4
          .bold
          .color(Vx.blue800)
          .make(),
      "Price".text.gray600.make(),
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
          alignment: MainAxisAlignment.spaceAround,
        )
      ]),
    ).white.roundedLg.shadowXs.p16.make().py12();
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
        "Description".text.xl2.semiBold.make().py8(),
        Html(
          data: viewModel.property!.description,
          style: {
            "body": Style(margin: Margins.zero),
            "p": Style(fontSize: FontSize(16)),
          },
        ),
      ]),
    ).white.roundedLg.shadowXs.p16.make().py12();
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
    ).white.roundedLg.shadowXs.p16.make().py12();
  }

  Widget _buildOwnerSection(PropertyDetailViewModel viewModel) {
    return VxBox(
      child: VStack([
        "Owner".text.xl2.semiBold.make().py8(),
        HStack([
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(
                viewModel.property!.owner.profileImage?.url ?? ""),
          ),
          // VStack([
          //   viewModel.property!.owner.name.text.lg.bold.make(),
          //   "Member since ${viewModel.property!.owner.registration.}".text.gray600.make(),
          // ]).px12().expand(),
        ]),
        HStack([
          _buildActionButton(Icons.phone, "Call", Colors.green,
              () => viewModel.launchPhoneCall(viewModel)),
          _buildActionButton(
              Icons.message, "Chat", Vx.blue600, () => viewModel.openChat()),
        ]).py16(),
      ]),
    ).white.roundedLg.shadowXs.p16.make().py12();
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
        .roundedLg
        .border(color: color)
        .make()
        .expand();
  }

  @override
  PropertyDetailViewModel viewModelBuilder(BuildContext context) =>
      PropertyDetailViewModel(property: property);
}
