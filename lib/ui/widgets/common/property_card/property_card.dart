import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/extensions/dynamic.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:stacked/stacked.dart';

import 'property_card_model.dart';

class PropertyCard extends StackedView<PropertyCardModel> {
  const PropertyCard(
      {required this.property,
      this.onTap,
      this.onFavorite,
      this.isFavorite = false,
      super.key});
  final Property property;
  final Function(Property value)? onTap;
  final Function(Property value)? onFavorite;
  final bool isFavorite;
  @override
  Widget builder(
    BuildContext context,
    PropertyCardModel viewModel,
    Widget? child,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap != null ? () => onTap!(property) : null,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: property.images.isNotEmpty
                      ? Image.network(
                          property.images[0].url,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            height: 160,
                            color: Colors.grey[300],
                            child: const Center(
                                child: Icon(Icons.image_not_supported)),
                          ),
                        )
                      : Container(
                          height: 160,
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.home)),
                        ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Nổi bật',
                      style: AppTextStyle.h5TitleTextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: () => viewModel.toggleFavorite(property),
                      icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: isFavorite ? Colors.red : Colors.grey)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: AppTextStyle.h3TitleTextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    property.price.currencyValueFormat(),
                    style: AppTextStyle.h3TitleTextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          (property.address.neighborhood ?? "")
                              .split(',')
                              .last
                              .trim(),
                          style: AppTextStyle.h5TitleTextStyle(
                            color: Colors.grey[700],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFeatureItem(Icons.straighten, '${property.sqm} m²'),
                      _buildFeatureItem(
                          Icons.king_bed, '${property.bedrooms} PN'),
                      _buildFeatureItem(
                          Icons.bathroom, '${property.bathrooms} VS'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primaryColor),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyle.h5TitleTextStyle(),
        ),
      ],
    );
  }

  @override
  PropertyCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      PropertyCardModel();
}
