import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  List<ProfileOption> get profileOptions => [
        ProfileOption(
          title: 'Cài đặt',
          icon: Icons.settings,
          action: () => navigateToSettings(),
        ),
        ProfileOption(
          title: 'Chỉnh sửa hồ sơ',
          icon: Icons.edit,
          action: () => navigateToEditProfile(),
        ),
        if (!(user?.roles?.firstOrNullWhere((e) => e.name == "partner") !=
            null))
          ProfileOption(
            title: 'Trở thành đối tác',
            icon: Icons.handshake_outlined,
            action: () => becomePartner(),
          ),
        if ((user?.roles?.firstOrNullWhere((e) => e.name == "partner") != null))
          ProfileOption(
            title: 'Quản lý bất động sản',
            icon: Icons.manage_accounts,
            action: () => manageProperties(),
          ),
        ProfileOption(
          title: 'Điều khoản dịch vụ',
          icon: Icons.description,
          action: () => showTermsAndConditions(),
        ),
      ];
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  bool get isLoggedIn => _authService.currentUser != null;
  User? get user => _authService.currentUser;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  void handleOptionTap(ProfileOption option) => option.action();

  void navigateToSettings() {}
  void navigateToEditProfile() {}
  void becomePartner() {
    _navigationService.navigateToPartnerRegistrationView();
  }

  void manageProperties() {}
  void showTermsAndConditions() {}

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void navigateToRegister() {
    _navigationService.navigateTo(Routes.registerView);
  }

  Future<void> logout() async {
    await _authService.signOut();
  }

  navigateToFavorite() {}
}

class ProfileOption {
  final String title;
  final IconData icon;
  final Function() action;

  ProfileOption({
    required this.title,
    required this.icon,
    required this.action,
  });
}
