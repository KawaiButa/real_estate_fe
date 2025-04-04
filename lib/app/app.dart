import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:real_estate_fe/services/article_service.dart';
import 'package:real_estate_fe/services/hive_service.dart';
import 'package:real_estate_fe/services/location_service.dart';
import 'package:real_estate_fe/services/partner_registration_service.dart';
import 'package:real_estate_fe/services/profile_service.dart';
import 'package:real_estate_fe/services/property_detail_service.dart';
import 'package:real_estate_fe/services/property_service.dart';
import 'package:real_estate_fe/services/property_type_service.dart';
import 'package:real_estate_fe/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:real_estate_fe/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:real_estate_fe/ui/views/welcome/welcome_view.dart';
import 'package:real_estate_fe/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/local_storage_service.dart';
import 'package:real_estate_fe/ui/views/full_image_preview/full_image_preview_view.dart';
import 'package:real_estate_fe/ui/views/home/home_view.dart';
import 'package:real_estate_fe/ui/views/search/search_view.dart';
import 'package:real_estate_fe/ui/bottom_sheets/filter/filter_sheet.dart';
import 'package:real_estate_fe/ui/views/profile/profile_view.dart';
import 'package:real_estate_fe/ui/views/login/login_view.dart';
import 'package:real_estate_fe/ui/views/register/register_view.dart';
import 'package:real_estate_fe/ui/views/register/register_view.dart';
import 'package:real_estate_fe/ui/views/property_detail/property_detail_view.dart';
import 'package:real_estate_fe/ui/views/partner_registration/partner_registration_view.dart';
import 'package:real_estate_fe/ui/views/favorite/favorite_view.dart';
import 'package:real_estate_fe/ui/dialogs/map/map_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: FullImagePreviewView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: PropertyDetailView),
    MaterialRoute(page: PartnerRegistrationView),
    MaterialRoute(page: FavoriteView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: PropertyService),
    LazySingleton(classType: AlertService),
    LazySingleton(classType: ProfileService),
    LazySingleton(classType: PropertyDetailService),
    LazySingleton(classType: ArticleService),
    LazySingleton(classType: PropertyTypeService),
    LazySingleton(classType: AppService),
    LazySingleton(classType: PartnerRegistrationService),
    LazySingleton(classType: LocationService)
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: FilterSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: MapDialog),
// @stacked-dialog
  ],
)
class App {}
