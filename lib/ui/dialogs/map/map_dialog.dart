import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart'; // Import the typeahead package

import 'map_dialog_model.dart';

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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(children: [
          _buildMap(context, viewModel, request.data),
          Positioned(
            top: 30.0,
            left: 8.0,
            right: 8.0,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(8.0),
              child: TypeAheadField<Location>(
                builder: (context, textEditingController, focusNode) {
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    // *** Adjust InputDecoration for smaller size ***
                    decoration: InputDecoration(
                      labelText:
                          "Search for a location", // Consider using .tr()
                      hintText:
                          "Enter address, city, etc.", // Consider using .tr()
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide
                            .none, // Remove border if Material provides background
                      ),
                      filled: true, // Add fill color
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      // Reduce vertical padding and make denser
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      isDense: true, // Makes the field more compact vertically
                    ),
                    // No need for onChanged here, suggestionsCallback handles it
                  );
                },
                loadingBuilder: (context) => const HStack([
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                  )
                ]),
                debounceDuration: const Duration(milliseconds: 500),
                suggestionsCallback: (pattern) async {
                  // Ensure the pattern is not empty before searching
                  if (pattern.trim().isNotEmpty) {
                    return await viewModel.searchLocations(pattern);
                  }
                  return []; // Return empty list if pattern is empty
                },
                itemBuilder: (context, suggestion) {
                  // Build each item in the dropdown
                  return ListTile(
                    title: Text(suggestion.address ?? "Unknown Address"),
                    subtitle: Text(
                        'Lat: ${suggestion.point.latitude.toStringAsFixed(4)}, Lng: ${suggestion.point.longitude.toStringAsFixed(4)}'),
                    dense: true, // Make suggestion items denser too
                  );
                },
                onSelected: (Location location) {
                  // When a location is selected from search, update the map center
                  viewModel.changeSelectedLocationFromTypeAhead(location);
                  viewModel.mapController.move(
                      location.point, 16.0); // Adjust zoom level as needed
                },
              ),
            ),
          ).backgroundColor(Vx.white),
          if (request.data)
            Positioned(
              top: 50, // Adjust as needed
              right: 10, // Adjust as needed
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.4, // Adjust as needed
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        viewModel
                            .changeSearchRadius(viewModel.circleRadius! + 5);
                      },
                    ),
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Slider(
                          min: 5,
                          max: 200,
                          value: viewModel.circleRadius ?? 10,
                          onChanged: (value) {
                            viewModel.changeSearchRadius(value);
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        viewModel
                            .changeSearchRadius(viewModel.circleRadius! - 5);
                      },
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VStack([
                (viewModel.busy(viewModel.selectedLocation)
                        ? "Loading....".text.medium.center.makeCentered().p8()
                        : (viewModel.selectedLocation?.address ?? "")
                            .text
                            .medium
                            .center
                            .makeCentered()
                            .p8())
                    .box
                    .color(Vx.white)
                    .make()
                    .wFull(context),
                "Save"
                    .tr() // Apply translation
                    .text // Convert to Text widget
                    .bold
                    .lg
                    .color(Colors.white) // Set text color
                    .makeCentered() // Center the text
                    .box
                    .rounded
                    .width(context.screenWidth) // Make button full width
                    .height(50)
                    .make() // Create the styled box widget
                    .color(
                        AppColors.primaryColor) // Use grey color when disabled
                    .onTap(() => viewModel.selectedLocation != null
                        ? viewModel.confirmLocation(
                            withRadius: request.data as bool)
                        : null)
              ]))
        ]),
      ),
    );
  }

  Widget _buildMap(
      BuildContext context, MapDialogModel viewModel, bool showRadius) {
    return FlutterMap(
      mapController: viewModel.mapController, // Use the MapController
      options: MapOptions(
        center: viewModel.selectedLocation?.point,
        zoom: 10.0,
        onTap: viewModel.changeSelectedLocation,
        interactiveFlags: InteractiveFlag.all &
            ~InteractiveFlag.rotate, // Enable all interactions except rotate
      ),

      children: [
        // Changed from layers to children
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
        ),
        if (viewModel.selectedLocation != null)
          StreamBuilder(
              stream: viewModel.mapController.mapEventStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox.shrink();
                return CircleLayer(
                  circles: [
                    CircleMarker(
                      // Add the CircleMarker
                      point: viewModel.selectedLocation!.point,
                      radius: (viewModel.circleRadius ?? 10.0) *
                          1000 /
                          viewModel.calculateMetersPerPixel(
                              viewModel.selectedLocation!.point.latitude,
                              snapshot.data!.zoom),
                      color: Colors.orange.withValues(alpha: 0.5),
                      borderColor: Colors.orange,
                      borderStrokeWidth: 2,
                    ),
                  ],
                );
              }),
        MarkerLayer(
          // Changed from MarkerLayerOptions to MarkerLayer
          markers: [
            if (viewModel.selectedLocation != null)
              Marker(
                width: 40.0,
                height: 40.0,
                point: viewModel.selectedLocation!.point,
                builder: (ctx) =>
                    const Icon(Icons.location_pin, color: Vx.red500),
              ),
          ],
        ),
      ],
    );
  }

  @override
  void onViewModelReady(MapDialogModel viewModel) {
    viewModel.initialise();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.mapController.move(viewModel.selectedLocation!.point, 10);
    });
    super.onViewModelReady(viewModel);
  }

  @override
  MapDialogModel viewModelBuilder(BuildContext context) => MapDialogModel();
}
