// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/alert_service.dart';
import '../services/app_service.dart';
import '../services/article_service.dart';
import '../services/auth_service.dart';
import '../services/banner_service.dart';
import '../services/local_storage_service.dart';
import '../services/location_post_service.dart';
import '../services/location_service.dart';
import '../services/partner_registration_service.dart';
import '../services/profile_service.dart';
import '../services/property_detail_service.dart';
import '../services/property_service.dart';
import '../services/property_type_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => PropertyService());
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => ProfileService());
  locator.registerLazySingleton(() => PropertyDetailService());
  locator.registerLazySingleton(() => ArticleService());
  locator.registerLazySingleton(() => PropertyTypeService());
  locator.registerLazySingleton(() => AppService());
  locator.registerLazySingleton(() => PartnerRegistrationService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BannerService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => LocationPostService());
}
