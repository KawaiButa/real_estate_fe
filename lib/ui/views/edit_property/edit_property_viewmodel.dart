// edit_property_viewmodel.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/parser/html_to_delta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/services/location_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:real_estate_fe/ui/views/property_creation/property_creation_viewmodel.dart';

class EditPropertyViewModel extends PropertyCreationViewModel {
  final PropertyService _propertyService = locator<PropertyService>();
  final Property property;
  final _locationService = locator<LocationService>();
  List<dynamic> allImages = [];
  List<String> deletedImageIds = [];
  List<File> newImages = [];
  EditPropertyViewModel({
    required this.property,
  });

  @override
  void initialise() async {
    formKey.currentState?.patchValue({
      'title': property.title,
      'price': property.price.toString(),
      'property_category': property.propertyCategory,
      'bedrooms': property.bedrooms.toString(),
      'bathrooms': property.bathrooms.toString(),
      'sqm': property.sqm.toString(),
      'street': property.address.street,
      'city': property.address.city,
      'description': property.description,
      'neighborhood': property.address.neighborhood,
    });
    final address = await _locationService.getAddressFromCoordinates(
        property.address.latitude, property.address.longitude);
    setSelectedLocation(Location(
        point: LatLng(property.address.latitude, property.address.longitude),
        address: address));
    descriptionController.document =
        Document.fromDelta(HtmlToDelta().convert(property.description));
    super.initialise();
    allImages = property.images.map((i) => NetworkImage(i.url)).toList();
    notifyListeners();
  }

// In ViewModel
  void handleImagePick(List<XFile> pickedFiles) {
    newImages.addAll(pickedFiles.map((f) => File(f.path)));
    allImages.addAll(newImages);
    notifyListeners();
  }

  void handleImageRemove(int index) {
    final image = allImages[index];
    if (image is NetworkImage) {
      deletedImageIds.add(_extractImageId(image.url));
    }
    allImages.removeAt(index);
    notifyListeners();
  }

  String _extractImageId(String url) {
    // Implementation depends on your URL structure
    return url.split('/').last;
  }

  @override
  Future<void> submitForm() async {
    setBusy(true);
    try {
      final formData = FormData.fromMap({
        'title': formKey.currentState?.value['title'],
        'deleted_images': deletedImageIds,
        // Add other fields
      });

      // Add new images
      for (var image in newImages) {
        formData.files.add(MapEntry(
          'image_list',
          await MultipartFile.fromFile(image.path),
        ));
      }

      await _propertyService.updateProperty(property.id, formData);
      // Handle success
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }
}
