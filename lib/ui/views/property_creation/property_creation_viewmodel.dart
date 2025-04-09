// property_creation_viewmodel.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/location_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:real_estate_fe/services/property_type_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PropertyCreationViewModel extends ReactiveViewModel {
  final PropertyService _propertyService = locator<PropertyService>();
  final _propertyTypeService = locator<PropertyTypeService>();
  final ImagePicker _imagePicker = ImagePicker();
  final _locationService = locator<LocationService>();
  final _dialogService = locator<DialogService>();
  MapController mapController = MapController();
  final formKey = GlobalKey<FormBuilderState>();
  final _alertService = locator<AlertService>();
  List<PropertyType>? get propertyTypes => _propertyTypeService.data;
  int _currentStep = 0;
  int get currentStep => _currentStep;
  final int _totalSteps = 5;
  int get totalSteps => _totalSteps;
  Location _selectedLocation = Location(point: LatLng(0.0, 0.0));
  Location get selectedLocation => _selectedLocation;
  final List<File> _images = [];
  List<File> get images => _images;
  String? neighborhood;
  String? city;
  String? street;
  bool locationDetailsFetched = false;
  QuillController descriptionController = QuillController.basic();

  @override
  List<ListenableServiceMixin> get listenableServices => [_propertyTypeService];

  void nextStep(FormBuilderState formState) {
    if (!formState.validate()) return;

    if (_currentStep < _totalSteps - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  Future<void> pickImages() async {
    final pickedFiles = await _imagePicker.pickMultiImage(
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    _images.addAll(pickedFiles.map((e) => File(e.path)));
    notifyListeners();
  }

  Future<void> submitForm() async {
    setBusy(true);
    formKey.currentState?.patchValue(
        {"description": descriptionController.document.toPlainText()});
    try {
      if (!formKey.currentState!.saveAndValidate()) {
        _alertService.error(
            title: "Create property",
            text: "There is error in your typed data");
        return;
      }
      _alertService.showLoading();
      await _propertyService.createProperty(
          formKey.currentState!.value, _images, selectedLocation);
      _alertService.stopLoading();
      _alertService.success(
          title: "Create Property".tr(),
          text: "Create property successfully".tr());
    } catch (e) {
      _alertService.error(title: "Create Property".tr(), text: e.toString());
    } finally {
      setBusy(false);
    }
  }

  String? validateTitle(String? value) {
    if (value == null || value.length < 10) {
      return 'Minimum 10 characters required'.tr();
    }
    if (value.length > 100) return 'Maximum 100 characters allowed'.tr();
    return null;
  }

  setSelectedLocation(Location value) => _selectedLocation = value;

  String? validatePrice(String? value) {}

  void onMapTap(TapPosition tapPosition, LatLng point) {
    _dialogService
        .showCustomDialog(
            variant: DialogType.map, title: "Select location".tr(), data: false)
        .then((result) {
      if (result != null) {
        _selectedLocation = result.data["location"];
        mapController.move(_selectedLocation.point, 16);
        notifyListeners();
      }
    });
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  String? formValue(String fieldName) {
    return formKey.currentState!.fields[fieldName]?.value;
  }

  void initialise() {
    _selectedLocation = Location(
        point: _locationService.currentPosition ?? LatLng(0.0, 0.0),
        address: _locationService.currentAddress);
    _locationService.getCurrentLocation(autoSave: true).then((value) async {
      _selectedLocation = Location(
          point: _locationService.currentPosition ?? LatLng(0.0, 0.0),
          address: _locationService.currentAddress);
      await fetchLocationDetails();
      notifyListeners();
    });
    descriptionController.document.changes.listen((data) {
      formKey.currentState?.patchValue(
          {"description": descriptionController.document.toPlainText()});
    });
    _propertyTypeService.fetchPropertyTypes();
    notifyListeners();
  }

  String? validateArea(String? value) {}

  String? validateBathrooms(String? value) {}

  String? validateBedrooms(String? value) {}

  Future<void> fetchLocationDetails() async {
    final lat = selectedLocation.point.latitude;
    final lon = selectedLocation.point.longitude;
    final url =
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$lat&lon=$lon';

    final response = await Dio().get(url,
        options: Options(headers: {
          'User-Agent': 'real_estate_fe/1.0 (21522441@gm.uit.edu.vn)'
        }));

    if (response.statusCode == 200) {
      final data = response.data;
      final address = data['address'] ?? {};
      formKey.currentState?.patchValue({
        "neighborhood": address['neighborhood'] ?? address['suburb'],
        "city": address['city'] ?? address['town'] ?? address['village'],
        "street": address['road'],
      });
      locationDetailsFetched = true;
      notifyListeners();
    } else {
      // Handle error as needed
    }
  }
}
