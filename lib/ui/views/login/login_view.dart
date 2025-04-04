import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StackedView<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Text(
                  'Chào mừng trở lại',
                  style: AppTextStyle.h1TitleTextStyle(
                    color: AppColors.primaryColorDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Email Field
                TextFormField(
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon:
                        Icon(Icons.email, color: AppColors.primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => viewModel.validateEmail(value),
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: viewModel.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    prefixIcon: Icon(Icons.lock, color: AppColors.primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) => viewModel.validatePassword(value),
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
                const SizedBox(height: 24),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed:
                      viewModel.isBusy ? null : () => _submitForm(viewModel),
                  child: Text(
                    'Đăng nhập',
                    style: AppTextStyle.h4TitleTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Google Sign-In Button
                SignInButton(
                  Buttons.Google,
                  text: 'Đăng nhập với Google',
                  onPressed: viewModel.signInWithGoogle,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 24),

                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chưa có tài khoản? ',
                      style: AppTextStyle.h5TitleTextStyle(),
                    ),
                    TextButton(
                      onPressed: viewModel.navigateToRegister,
                      child: Text(
                        'Đăng ký ngay',
                        style: AppTextStyle.h5TitleTextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(LoginViewModel viewModel) {
    if (_formKey.currentState!.validate()) {
      viewModel.loginWithEmail();
    }
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
