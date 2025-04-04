import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/extensions/string.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:stacked/stacked.dart';

import 'property_list_item_model.dart';

class PropertyListItem extends StackedView<PropertyListItemModel> {
  const PropertyListItem({required this.property, this.onTap, super.key});
  final Property property;
  final Function(Property property)? onTap;
  @override
  Widget builder(
    BuildContext context,
    PropertyListItemModel viewModel,
    Widget? child,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap != null ? () => onTap!(property) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: property.images.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(property.images.first.url),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.title,
                      style: AppTextStyle.h4TitleTextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      property.price.currencyValueFormat(),
                      style: AppTextStyle.h4TitleTextStyle(
                        color: AppColors.accentColor,
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
                            property.address.neighborhood ?? "",
                            style: AppTextStyle.h6TitleTextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildFeatureItem(
                            Icons.king_bed, '${property.bedrooms} PN'),
                        _buildFeatureItem(
                            Icons.bathroom, '${property.bathrooms} VS'),
                        _buildFeatureItem(
                            Icons.straighten, '${property.sqm} m²'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PropertyListItemModel viewModelBuilder(
    BuildContext context,
  ) =>
      PropertyListItemModel();

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primaryColor),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyle.h6TitleTextStyle()),
      ],
    );
  }
}
