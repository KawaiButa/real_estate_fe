import 'package:flutter/material.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:real_estate_fe/models/news_article.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:real_estate_fe/services/property_type_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/banner.dart' as banner;
import 'package:stacked_services/stacked_services.dart';

List<NewsArticle> sampleNewsArticles = [
  NewsArticle(
    id: '1',
    title: 'Property Market Expected to Grow in Q2 2023',
    shortDescription:
        'Experts predict a 15% increase in property transactions as interest rates stabilize.',
    imageUrl: 'https://example.com/news1.jpg',
    publishDate: DateTime.now().subtract(const Duration(days: 2)),
    author: 'Nguyen Mai',
    sourceUrl: 'https://vnexpress.net/property-market-q2-2023',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  NewsArticle(
    id: '2',
    title: 'New Metro Line to Boost Property Values in District 9',
    shortDescription:
        'The upcoming Metro Line 1 completion is already affecting property prices in the eastern part of the city.',
    imageUrl: 'https://example.com/news2.jpg',
    publishDate: DateTime.now().subtract(const Duration(days: 3)),
    author: 'Tran Hoang',
    sourceUrl: 'https://batdongsan.com.vn/metro-line-impact',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  // Add more news articles as needed
];
const sampleBanners = [
  banner.Banner(
    id: '1',
    title: 'Cơ hội sở hữu căn hộ cao cấp',
    description: 'Ưu đãi đặc biệt cho khách hàng mới',
    imageUrl: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914',
    link: '/promotion/1',
  ),
  banner.Banner(
    id: '2',
    title: 'Dự án mới tại Quận 2',
    description: 'Không gian sống xanh, hiện đại',
    imageUrl: 'https://images.unsplash.com/photo-1560518883-ce09059eeffa',
    link: '/project/2',
  ),
  banner.Banner(
    id: '3',
    title: 'Đầu tư bất động sản 2023',
    description: 'Tham khảo chiến lược đầu tư hiệu quả',
    imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750',
    link: '/investment-guide',
  ),
];

class HomeViewModel extends ReactiveViewModel {
  final PropertyService _propertyService = locator<PropertyService>();
  final _navigationService = locator<NavigationService>();
  final _appService = locator<AppService>();
  final PropertyTypeService _propertyTypeService =
      locator<PropertyTypeService>();
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_propertyService, _propertyTypeService];
  List<Property>? get properties => _propertyService.data;
  List<PropertyType>? get propertyTypes => _propertyTypeService.data;
  List<banner.Banner> banners = [];
  List<NewsArticle> newsArticles = [];
  List<Location> locations = [];
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
    // locations = sampleLocations;
  }

  Future<void> fetchBanners() async {
    banners = sampleBanners;
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
}
