import 'package:flutter/material.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:real_estate_fe/models/location_post.dart';
import 'package:real_estate_fe/models/news_article.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/banner_service.dart';
import 'package:real_estate_fe/services/location_post_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:real_estate_fe/services/property_type_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/banner.dart' as banner;
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final PropertyService _propertyService = locator<PropertyService>();
  final _navigationService = locator<NavigationService>();
  final _appService = locator<AppService>();
  final PropertyTypeService _propertyTypeService =
      locator<PropertyTypeService>();
  final _bannerService = locator<BannerService>();
  final _locationPostService = locator<LocationPostService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [
        _propertyService,
        _bannerService,
        _propertyTypeService,
        _locationPostService
      ];
  List<Property>? get properties => _propertyService.data;
  List<PropertyType>? get propertyTypes => _propertyTypeService.data;
  List<banner.Banner>? get banners => _bannerService.data;
  List<NewsArticle> newsArticles = [];
  List<LocationPost>? get locations => _locationPostService.data;
  Future<void> initialise() async {
    try {
      setBusy(true);
      fetchProperties();
      fetchPropertyTypes();
      fetchNews();
      fetchBanners();
      fetchLocations();
    } catch (error) {
      debugPrint("Error when initializing HomeViewModel ===> $error");
      setError(error);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> fetchProperties() async {
    setBusyForObject(properties, true);
    await _propertyService.fetchProperties(forceRefresh: !initialised);
    setBusyForObject(properties, false);
  }

  Future<void> fetchNews() async {}

  Future<void> fetchLocations() async {
    setBusyForObject(locations, true);
    await _locationPostService.fetchLocationPost();
    setBusyForObject(locations, false);
  }

  Future<void> fetchPropertyTypes() async {
    setBusyForObject(propertyTypes, true);
    try {
      await _propertyTypeService.fetchPropertyTypes();
    } catch (error) {
      debugPrint("Error when fetching properties ====> $error");
    } finally {
      setBusyForObject(propertyTypes, false);
    }
  }

  filterByType(PropertyType type) {
    _appService.changeFilter(
        _appService.currentFilters.copyWith(propertyType: type.name));
    if (_appService.isWelcome) {
      _appService.changeIndex(1);
    } else {
      _navigationService.navigateToWelcomeView();
    }
  }

  Future<void> fetchBanners() async {
    setBusyForObject(banners, true);
    await _bannerService.fetchBanner();
    setBusyForObject(banners, false);
  }

  void changeLocationPostCountType(String? value) {
    _locationPostService.fetchLocationPost(type: value);
  }

  navigateToPropertyDetail(Property value) {
    _navigationService.navigateToPropertyDetailView(property: value);
  }
}
