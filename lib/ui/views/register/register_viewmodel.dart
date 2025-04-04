// register_viewmodel.dart
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum RegistrationStep { name, email, password, phone }

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  // Registration state
  RegistrationStep _currentStep = RegistrationStep.name;
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _phone = '';
  bool _isPasswordVisible = false;

  // Getters
  RegistrationStep get currentStep => _currentStep;
  int get currentStepIndex => _currentStep.index;
  bool get isPasswordVisible => _isPasswordVisible;

  // Step management
  void nextStep() {
    if (_currentStep.index < RegistrationStep.values.length - 1) {
      _currentStep = RegistrationStep.values[_currentStep.index + 1];
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep.index > 0) {
      _currentStep = RegistrationStep.values[_currentStep.index - 1];
      notifyListeners();
    }
  }

  // Field setters
  void setName(String value) => _name = value;
  void setEmail(String value) => _email = value;
  void setPassword(String value) => _password = value;
  void setConfirmPassword(String value) => _confirmPassword = value;
  void setPhone(String value) => _phone = value;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  // Validation logic
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'Please enter your name' : null;

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value!) ? null : 'Invalid email format';
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) return 'Password is required';
    if (value!.length < 6) return 'At least 6 characters required';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != _password) return 'Passwords do not match';
    return null;
  }

  String? validatePhone(String? value) {
    if (value?.isEmpty ?? true) return 'Phone number is required';
    final phoneRegex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return phoneRegex.hasMatch(value!) ? null : 'Invalid phone number';
  }

  // Registration logic
  Future<void> register() async {
    setBusy(true);
    AlertService().showLoading();
    try {
      final user = await _authService.registerWithEmail(
          email: _email, password: _password, username: _name, phone: _phone);
      AlertService().stopLoading();
      if (user != null) _navigationService.replaceWith(Routes.loginView);
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }
}
