import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:stacked/stacked.dart';

import 'location_card_model.dart';

class LocationCard extends StackedView<LocationCardModel> {
  const LocationCard({super.key, required this.location, this.onTap});
  final Location location;
  final Function(Location location)? onTap;
  @override
  Widget builder(
    BuildContext context,
    LocationCardModel viewModel,
    Widget? child,
  ) {
    return InkWell(
      onTap: onTap != null ? () => onTap!(location) : null,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: NetworkImage(""),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gradient overlay for better text visibility
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
            // Location name and property count
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: AppTextStyle.h4TitleTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${""} ${"posts".tr()}',
                    style: AppTextStyle.h5TitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LocationCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      LocationCardModel();
}
