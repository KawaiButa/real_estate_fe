// partner_registration_viewmodel.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/partner_registration.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/partner_registration_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class PartnerRegistrationViewModel extends BaseViewModel {
  final ImagePicker _picker = ImagePicker();

  PartnerType _selectedType = PartnerType.Individual;
  File? _profileImage;
  List<File> _certificationImages = [];
  DateTime? _dateOfBirth;
  String? _representativeName;
  String? _taxId;
  final TextEditingController _dateController = TextEditingController();

  PartnerType get selectedType => _selectedType;
  File? get profileImage => _profileImage;
  List<File> get certificationImages => _certificationImages;
  TextEditingController get dateController => _dateController;

  final _partnerRegistrationService = locator<PartnerRegistrationService>();
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  void setPartnerType(PartnerType? type) {
    if (type != null) {
      _selectedType = type;
      notifyListeners();
    }
  }

  Future<void> pickProfileImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _profileImage = File(image.path);
      notifyListeners();
    }
  }

  Future<void> pickCertificateImages() async {
    final images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      _certificationImages.addAll(images.map((e) => File(e.path)));
      notifyListeners();
    }
  }

  void removeCertificateImage(File image) {
    _certificationImages.remove(image);
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      _dateOfBirth = date;
      _dateController.text = "${date.day}/${date.month}/${date.year}";
      notifyListeners();
    }
  }

  void setRepresentativeName(String value) => _representativeName = value;
  void setTaxId(String value) => _taxId = value;

  String? validateDate(String? value) {
    if (_dateOfBirth == null) return 'Please select a date';
    return null;
  }

  String? validateRepresentativeName(String? value) {
    if (selectedType == PartnerType.Enterprise && (value?.isEmpty ?? true)) {
      return 'Representative name is required';
    }
    return null;
  }

  String? validateTaxId(String? value) {
    if (selectedType == PartnerType.Enterprise) {
      if (value?.isEmpty ?? true) return 'Tax ID is required';
      if (value!.length < 8) return 'Invalid Tax ID format';
    }
    return null;
  }

  Future<void> submitRegistration() async {
    setBusy(true);
    if (_profileImage == null) {
      _alertService.error(
          title: "Partner Registration".tr(),
          text: "Please filled in all field");
    }
    if (_selectedType == PartnerType.Enterprise &&
        (_certificationImages.length < 3 ||
            _representativeName.isEmptyOrNull ||
            _taxId.isEmptyOrNull)) {
      _alertService.error(
          title: "Partner Registration".tr(),
          text: "Please filled in all field");
      return;
    }
    try {
      List<MultipartFile> multipartImages = [];
      for (var imageFile in _certificationImages) {
        multipartImages.add(await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ));
      }
      FormData formData = FormData.fromMap({
        "profile_img": await MultipartFile.fromFile(_profileImage?.path ?? ""),
        "date_of_birth": _dateOfBirth!.toIso8601String(),
        "type": _selectedType,
        if (_selectedType == PartnerType.Enterprise) ...{
          "business_registration_certificate_img": multipartImages,
          "authorized_representative_name": _representativeName,
          "tax_id": _taxId
        }
      });
      final registration = _partnerRegistrationService.register(formData);
      await AlertService().success(
          title: "Partner Registration".tr(),
          text: "You have successfully registered as a Partner".tr());
      _navigationService.back();
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }
}
