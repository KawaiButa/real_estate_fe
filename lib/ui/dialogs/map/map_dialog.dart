import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/location.dart'; // Assuming this is your Location model
// import 'package:real_estate_fe/ui/widgets/common/custom_button/custom_button.dart'; // Assuming this is your custom button
// Replace with a standard button for this example if CustomButton is not defined broadly
// For example:
// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onTap;
//   final double? width;
//   const CustomButton({Key? key, required this.text, this.onTap, this.width}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: ElevatedButton(onPressed: onTap, child: Text(text)),
//     );
//   }
// }

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart'; // For .text and .backgroundColor (if used carefully)
import 'package:flutter_typeahead/flutter_typeahead.dart';
// For new features, you might need:
// import 'package:geolocator/geolocator.dart'; // For current location
// import 'package:permission_handler/permission_handler.dart'; // For permissions

import 'map_dialog_model.dart'; // Your ViewModel

class MapDialog extends StackedView<MapDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MapDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MapDialogModel viewModel,
    Widget? child,
  ) {
    // Assuming request.data is a boolean indicating if radius controls should be shown
    final bool showRadiusSelector = request.data is bool ? request.data : false;

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), // Slightly larger radius
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // Max width for dialog
        height: MediaQuery.of(context).size.height * 0.75, // Increased height
        child: Column(
          // Use Column for better structure: Search, Map, Info/Button
          children: [
            _buildSearchBar(context, viewModel),
            Expanded(
              child: Stack(
                children: [
                  _buildMap(context, viewModel, showRadiusSelector),
                  _buildMapOverlays(context, viewModel, showRadiusSelector),
                ],
              ),
            ),
            _buildBottomSection(context, viewModel, showRadiusSelector),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, MapDialogModel viewModel) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TypeAheadField<Location>(
            controller: viewModel.searchController,
            builder: (context, controller, focusNode) {
              return TextFormField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: "Enter address, city, etc.",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50], // Light fill for the field
                  prefixIcon:
                      Icon(Icons.search, color: Theme.of(context).primaryColor),
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            viewModel.clearSearch();
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0), // Adjusted padding
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 15),
              );
            },
            loadingBuilder: (context) =>
                const LinearProgressIndicator(minHeight: 2),
            emptyBuilder: (context) => const ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.orangeAccent),
                  title: Text("No locations found."),
                  dense: true,
                ),
            errorBuilder: (context, error) => ListTile(
                  leading:
                      const Icon(Icons.error_outline, color: Colors.redAccent),
                  title: Text("Error searching: $error"),
                  dense: true,
                ),
            debounceDuration: const Duration(milliseconds: 600),
            suggestionsCallback: (pattern) async {
              if (pattern.trim().length > 2) {
                return await viewModel.searchLocations(pattern);
              }
              return [];
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_on_outlined,
                    color: Theme.of(context).primaryColor),
                title: Text(suggestion.address ?? "Unknown Address",
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text(
                  'Lat: ${suggestion.point.latitude.toStringAsFixed(4)}, Lng: ${suggestion.point.longitude.toStringAsFixed(4)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                dense: true,
              );
            },
            onSelected: (Location location) {
              viewModel.changeSelectedLocationFromTypeAhead(location);
            },
            decorationBuilder: (context, child) {
              return Material(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: child,
              );
            }),
      ),
    );
  }

  Widget _buildMap(
      BuildContext context, MapDialogModel viewModel, bool showRadius) {
    return FlutterMap(
      mapController: viewModel.mapController,
      options: MapOptions(
        zoom: 13,
        center: viewModel.selectedLocation?.point ?? LatLng(0, 0),
        onTap: viewModel.changeSelectedLocation,
        onPositionChanged: (camera, hasGesture) {
          if (hasGesture) {
            viewModel.onMapPositionChanged(camera, showRadius);
          }
        },
        onMapEvent: (event) {
          viewModel.zoomValue.value = event.zoom;
        },
        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.app', // Good practice
        ),
        if (viewModel.selectedLocation != null && showRadius)
          ValueListenableBuilder(
            valueListenable: viewModel.zoomValue,
            builder: (context, value, child) => CircleLayer(
              circles: [
                CircleMarker(
                  point: viewModel.selectedLocation!.point,
                  radius: viewModel.circlePixelRadius,
                  color: AppColors.primaryColor.withValues(alpha: 0.25),
                  borderColor: AppColors.primaryColor.withValues(alpha: 0.7),
                  borderStrokeWidth: 2,
                  useRadiusInMeter: false,
                ),
              ],
            ),
          ),
        if (viewModel.selectedLocation != null)
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: viewModel.selectedLocation!.point,
                builder: (BuildContext context) {
                  return const Icon(Icons.location_pin,
                      color: Colors.redAccent, size: 40);
                },
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildMapOverlays(
      BuildContext context, MapDialogModel viewModel, bool showRadiusSelector) {
    return Stack(
      children: [
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton.small(
            heroTag: 'currentLocationFab',
            onPressed: () => viewModel.goToCurrentLocation(),
            backgroundColor: Colors.white,
            tooltip: "My Location",
            child: Icon(Icons.my_location, color: AppColors.primaryColor),
          ),
        ),
        Positioned(
          bottom: 70.0,
          right: 16.0,
          child: Column(
            children: [
              FloatingActionButton.small(
                heroTag: 'zoomInFab',
                onPressed: () => viewModel.zoomIn(),
                backgroundColor: Colors.white,
                tooltip: "Zoom In",
                child: Icon(Icons.add, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 8),
              FloatingActionButton.small(
                heroTag: 'zoomOutFab',
                onPressed: () => viewModel.zoomOut(),
                backgroundColor: Colors.white,
                tooltip: "Zoom Out",
                child: Icon(Icons.remove, color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        if (showRadiusSelector)
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Radius: ${viewModel.circleRadius?.toStringAsFixed(1) ?? '5'} km",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.35, // Constrain width
                      height: 30,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2.0,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 8.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 16.0),
                        ),
                        child: Slider(
                          min: viewModel.minRadius,
                          max: viewModel.maxRadius,
                          divisions:
                              ((viewModel.maxRadius - viewModel.minRadius) /
                                      0.5)
                                  .round(), // e.g. 0.5km steps
                          value: viewModel.circleRadius ?? viewModel.minRadius,
                          label:
                              "${viewModel.circleRadius?.toStringAsFixed(1) ?? 'N/A'} km",
                          activeColor: AppColors.primaryColor,
                          inactiveColor: Colors.grey[300],
                          onChanged: (value) {
                            viewModel.changeSearchRadius(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomSection(
      BuildContext context, MapDialogModel viewModel, bool showRadius) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              child: Text(
                viewModel.busy(viewModel.selectedLocation)
                    ? "Fetching address..."
                    : viewModel.selectedLocation?.address ??
                        "Tap on map or search to select location",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: viewModel.selectedLocation?.address == null &&
                          !viewModel.isBusy
                      ? Colors.grey[600]
                      : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ).p8(),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            // Using ElevatedButton for better Material Design adherence
            icon: const Icon(Icons.check_circle_outline),
            label: const Text("Confirm Location"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            onPressed: viewModel.selectedLocation != null && !viewModel.isBusy
                ? () => viewModel.confirmLocation(withRadius: showRadius)
                : null, // Button is disabled if no location or busy
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(MapDialogModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }

  @override
  MapDialogModel viewModelBuilder(BuildContext context) => MapDialogModel();
}
