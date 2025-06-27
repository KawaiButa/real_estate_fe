import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:real_estate_fe/app/app.bottomsheets.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/review.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/property_detail_service.dart';
import 'package:real_estate_fe/services/property_verification_service.dart';
import 'package:real_estate_fe/services/review_service.dart';
import 'package:real_estate_fe/services/user_action_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailViewModel extends FutureViewModel<Property> {
  int _currentImageIndex = 0;
  bool _isFavorite = false;
  final _navigationService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  final _propertyVerificationService = locator<PropertyVerificationService>();
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _userActionService = locator<UserActionService>();
  final _appService = locator<AppService>();
  PropertyDetailViewModel({required property}) {
    _propertyDetailService.data = property;
  }
  // Controllers for new review and OTP
  final TextEditingController newReviewController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  int get currentImageIndex => _currentImageIndex;
  bool get isFavorite => _isFavorite;

  final _propertyDetailService = locator<PropertyDetailService>();
  final _reviewService = locator<ReviewService>();
  Property? get property => _propertyDetailService.data;
  List<Review>? get reviews => _reviewService.data?.data;
  bool _canReview = false;
  bool get canReview => _canReview;
  Timer? _timer;
  MapController mapController = MapController();
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_propertyDetailService, _reviewService];

  int get totalReviewCount => _reviewService.data?.metadata.total ?? 0;
  void setImageIndex(int index) {
    _currentImageIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Future<Property> futureToRun() => fetchProperty();

  Future<Property> fetchProperty() async {
    fetchReview();
    final property = await _propertyDetailService
        .fetchPropertyDetail(_propertyDetailService.data!.id);
    if (property == null) throw Exception("No property found");
    _timer = Timer(const Duration(seconds: 30), () {
      if (!disposed) {
        _onUserStayed();
      }
    });
    return property;
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

  Future<void> launchGoogleMaps() async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${property!.address.latitude},${property!.address.longitude}',
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
    if (property?.owner == null) {
      locator<AlertService>().showErrorToast(
          "Error when trying to access owner information. Please try again later"
              .tr());
      return;
    }
    _navigationService.navigateToChatDetailView(user: property!.owner!);
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

  void openQRScanner() async {
    try {
      final result = await _dialogService.showCustomDialog(
        variant: DialogType.qrScanner,
        title: "QR Scammer",
      );
      if ((result?.confirmed ?? false) && result?.data != null) {
        _alertService.showLoading();
        await _propertyVerificationService.verifyUser(
            propertyId: property!.id, code: result!.data);
      }
    } catch (error) {
      await _alertService.error(
          title: "Error".tr(),
          text:
              "Error when validate you to review this property. Please try again in a few moment."
                  .tr());
    } finally {
      _alertService.stopLoading();
      notifyListeners();
    }
  }

  Future<bool> verifyOTP() async {
    // Attempt to verify the OTP
    // If success, set user as authorized in your state
    // Return true if successful, false otherwise
    return false;
  }

  void goToReviewPage() {
    _navigationService.navigateToReviewView(property: property!);
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

  void generateReviewQR() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.qrCode, title: "QR Code", data: property?.id);
  }

  Timer _onUserStayed() {
    _userActionService.createAction(propertyId: property!.id, type: "view");
    return Timer(const Duration(seconds: 30), () {
      if (!disposed) {
        _timer = _onUserStayed();
      }
    });
  }

  void fetchReview() async {
    try {
      setBusyForObject(reviews, true);
      if (property != null) {
        final response =
            await _reviewService.fetchPropertyReviews(property!.id);
      }
    } finally {
      setBusyForObject(reviews, false);
    }
  }

  void navigateToReviewView() {
    _navigationService.navigateToReviewView(property: property!);
  }

  void navigateToNewTourviewView() {
    _navigationService.navigateToTourviewView();
  }

  void showAiAnalysis() {
    final bottomSheetService = locator<BottomSheetService>();
    bottomSheetService.showCustomSheet(
      variant: BottomSheetType.aiResult,
      data: [property],
      isScrollControlled: true,
    );
  }

  void addToCompareList() {
    if (!_appService.comparedProperties
        .map((e) => e.id)
        .contains(property?.id)) {
      _appService
          .updateCompareList([..._appService.comparedProperties, property!]);
    }
  }
}
