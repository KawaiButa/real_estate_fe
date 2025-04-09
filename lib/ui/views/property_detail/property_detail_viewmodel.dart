// property_detail_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/property_detail_service.dart';
import 'package:real_estate_fe/services/property_verification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailViewModel extends ReactiveViewModel {
  int _currentImageIndex = 0;
  bool _isFavorite = false;
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  final _propertyVerificationService = locator<PropertyVerificationService>();
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  PropertyDetailViewModel({required property}) {
    _propertyDetailService.data = property;
  }
  // Controllers for new review and OTP
  final TextEditingController newReviewController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  int get currentImageIndex => _currentImageIndex;
  bool get isFavorite => _isFavorite;

  final _propertyDetailService = locator<PropertyDetailService>();
  Property? get property => _propertyDetailService.data;

  bool _canReview = false;
  bool get canReview => _canReview;

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_propertyDetailService];
  void setImageIndex(int index) {
    _currentImageIndex = index;
    notifyListeners();
  }

  void toggleFavorite() {
    _propertyDetailService.fetchPropertyDetail(property!.id);
    fetchAllowReview();
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void openFullScreenGallery(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: PhotoViewGallery.builder(
          itemCount: property!.images.length,
          builder: (context, index) => PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(property!.images[index].url),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(color: Colors.black),
        ),
      ),
    );
  }

  Future<void> launchGoogleMaps(PropertyDetailViewModel viewModel) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${viewModel.property!.address.latitude},${viewModel.property!.address.longitude}',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> launchPhoneCall(PropertyDetailViewModel viewModel) async {
    if (viewModel.property?.owner == null) return;
    final url = 'tel:${viewModel.property!.owner!.phone}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void openChat() {
    // Implement chat navigation
  }

  deleteProperty() async {
    final result = await _alertService.showConfirm(
        title: "Delete property", text: "Do you want to delete this property?");
    if (result != true) return;
    try {
      _alertService.showLoading();
      await _propertyDetailService.deleteProperty(property!.id);
      await _alertService.success(
          title: "Delete property".tr(),
          text: "Delete property successfully".tr());
    } catch (error) {
      await _alertService.error(
          title: "Delete property".tr(),
          text: "Error when deleting property: $error");
    } finally {
      _alertService.stopLoading();
    }
  }

  void editProperty() {
    _navigationService.navigateToEditPropertyView(property: property!);
  }

  Future<bool> submitReview() async {
    final newReviewText = newReviewController.text.trim();
    if (newReviewText.isEmpty) {
      _snackbarService.showSnackbar(
          message: "You cannot post and empty review");
      return true; // or false, depending on your flow
    }
    return true;
  }

  void openQRScanner() {
    // Navigate to your QR scanner screen
    // On success, set user as authorized in your state
  }

  Future<bool> verifyOTP() async {
    // Attempt to verify the OTP
    // If success, set user as authorized in your state
    // Return true if successful, false otherwise
    return false;
  }

  bool checkUserIsAuthorized() {
    // Your logic to check if user is authorized to leave a review
    return false;
  }

  void goToReviewPage() {
    // e.g. navigate to a full-screen “All Reviews” page
  }

  void fetchAllowReview() async {
    try {
      setBusyForObject(_canReview, true);
      if (_authService.data == null) {
        _authService.getUserFromLocalStorage();
      }
      final verification = await _propertyVerificationService.checkAllowReview(
          propertyId: property!.id);
      _canReview = verification != null;
    } finally {
      setBusyForObject(_canReview, false);
      notifyListeners();
    }
  }
}
