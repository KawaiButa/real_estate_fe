import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked_services/stacked_services.dart';

class MapDialogModel extends ReactiveViewModel {
  MapController mapController = MapController();
  TextEditingController searchController = TextEditingController();
  final _locationService = locator<LocationService>();
  final _appService = locator<AppService>();
  final _dialogService = locator<DialogService>();
  List<String> get provinces => _locationService.provinces;
  String? _selectedProvinces;
  String? get selectedProvince => _selectedProvinces;
  Location? selectedLocation;
  double? circleRadius;
  double minRadius = 5;
  double maxRadius = 200;
  ValueNotifier<double> zoomValue = ValueNotifier(13);
  @override
  List<ListenableServiceMixin> get listenableServices => [_locationService];

  double get circlePixelRadius =>
      (circleRadius ?? 10.0) *
      1000 /
      calculateMetersPerPixel(
          selectedLocation!.point.latitude, zoomValue.value);
  initialise() async {
    try {
      setBusy(true);
      circleRadius = _appService.currentFilters.radius;
      if (_locationService.currentPosition == null) {
        await _locationService.getCurrentLocation(autoSave: true);
      }
      selectedLocation = Location(
          point: _locationService.currentPosition!,
          address: _locationService.currentAddress);
      mapController.move(selectedLocation!.point, 10);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void onProvinceChanged(String? newValue) {
    _locationService.getGeolocationFromAddress("$newValue, Việt Nam");
  }

  void changeSelectedLocation(TapPosition tapPosition, LatLng point) async {
    setBusyForObject(selectedLocation, true);
    final address = await _locationService.getAddressFromCoordinates(
        point.latitude, point.longitude);
    selectedLocation = Location(point: point, address: address);
    mapController.move(point, 16);
    notifyListeners();
    setBusyForObject(selectedLocation, false);
  }

  void confirmLocation({required bool withRadius}) {
    _dialogService.completeDialog(DialogResponse(confirmed: true, data: {
      "location": selectedLocation,
      if (withRadius) "radius": circleRadius
    }));
  }

  Future<List<Location>> searchLocations(String query) async {
    return await _locationService.searchLocation(query);
  }

  void changeSearchRadius(double value) {
    circleRadius = value;
    notifyListeners();
  }

  void changeSelectedLocationFromTypeAhead(Location location) {
    selectedLocation = location;
    notifyListeners();
  }

  double calculateMetersPerPixel(double latitude, double zoom) {
    const double earthRadius = 6378137.0;
    final double latitudeRadians = latitude * (pi / 180.0);

    final double metersPerPixel =
        (2 * pi * earthRadius * cos(latitudeRadians)) / (256 * pow(2, zoom));

    return metersPerPixel;
  }

  void zoomIn() {
    mapController.move(mapController.center, mapController.zoom + 1);
  }

  void zoomOut() {
    mapController.move(mapController.center, mapController.zoom - 1);
  }

  goToCurrentLocation() async {
    if (_locationService.currentPosition == null) {
      await _locationService.getCurrentLocation(autoSave: true);
    }
    selectedLocation = Location(
        point: _locationService.currentPosition!,
        address: _locationService.currentAddress);
    mapController.move(selectedLocation!.point, 10);
  }

  void clearSearch() {
    searchController.clear();
  }

  void onMapPositionChanged(MapPosition camera, bool showRadius) {}
}
