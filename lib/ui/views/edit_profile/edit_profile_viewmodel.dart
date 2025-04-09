import 'dart:io'; // For File type if using image_picker

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _alertService = locator<AlertService>();
  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _phoneController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController get phoneController => _phoneController;

  User? get user => _authService.currentUser;
  File? _selectedImageFile;
  File? get selectedImageFile => _selectedImageFile;
  @override
  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
  void initialise() {
    _authService.fetchProfile();
  }

  // --- Actions ---
  Future<void> changeProfileImage() async {
    final pickedFile = await _imagePicker.pickImage(
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      _selectedImageFile = File(pickedFile.name);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> saveProfile() async {
    final username = _usernameController.text;
    final phone = _phoneController.text;

    // 1. Validate input if necessary
    if (username.isEmpty || phone.isEmpty) {
      _snackbarService.showSnackbar(
          message: "Username and Phone cannot be empty.");
      return;
    }

    setBusy(true);
    try {
      _alertService.showLoading();
      await _authService.updateProfile(
        username: username,
        phone: phone,
        image: _selectedImageFile,
      );
      _snackbarService.showSnackbar(
          message: "Profile saved successfully!",
          duration: const Duration(seconds: 2));
    } catch (e) {
      print("Error saving profile: $e");
      _snackbarService.showSnackbar(message: "Error saving profile: $e");
    } finally {
      setBusy(false); // Hide loading indicator
    }
  }

  // --- Cleanup ---
  @override
  void dispose() {
    // Dispose controllers when the ViewModel is disposed
    _usernameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
