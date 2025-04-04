// property_detail_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/services/property_detail_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailViewModel extends ReactiveViewModel {
  int _currentImageIndex = 0;
  bool _isFavorite = false;

  PropertyDetailViewModel({required property}) {
    _propertyDetailService.data = property;
  }

  int get currentImageIndex => _currentImageIndex;
  bool get isFavorite => _isFavorite;

  final _propertyDetailService = locator<PropertyDetailService>();
  Property? get property => _propertyDetailService.data;

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_propertyDetailService];
  void setImageIndex(int index) {
    _currentImageIndex = index;
    notifyListeners();
  }

  void toggleFavorite() {
    _propertyDetailService.fetchPropertyDetail(property!.id);
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
    final url = Uri.encodeFull(
      'https://www.google.com/maps/search/?api=1&query='
      '${viewModel.property!.address.latitude},${viewModel.property!.address.longitude}',
    );

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchPhoneCall(PropertyDetailViewModel viewModel) async {
    final url = 'tel:${viewModel.property!.owner.phone}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void openChat() {
    // Implement chat navigation
  }
}
