// register_view.dart
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  final _formKey = GlobalKey<FormState>();

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return BasePage(
      title: "Register".tr(),
      showAppBar: true,
      showLeadingAction: true,
      appBarColor: AppColors.primaryColor,
      body: VStack([
        VxBox(
          child: Form(
            key: _formKey,
            child: VStack([
              Visibility(
                  visible: viewModel.currentStepIndex >= 0,
                  child: _buildNameStep(viewModel)),
              UiSpacer.vSpace(),
              Visibility(
                  visible: viewModel.currentStepIndex >= 1,
                  child: _buildEmailStep(viewModel)),
              UiSpacer.vSpace(),
              Visibility(
                  visible: viewModel.currentStepIndex >= 2,
                  child: _buildPhoneStep(viewModel)),
              UiSpacer.vSpace(),
              Visibility(
                  visible: viewModel.currentStepIndex >= 3,
                  child: _buildPasswordStep(viewModel)),
              HStack(
                [
                  (viewModel.currentStepIndex == 3 ? "Register" : "Next")
                      .text
                      .center
                      .white
                      .bold
                      .make()
                      .box
                      .width(100)
                      .color(Vx.indigo600)
                      .rounded
                      .p16
                      .make()
                      .py8()
                      .onTap(() => _handleNext(viewModel)),

                  // Next/Register button
                ],
                alignment: MainAxisAlignment.end,
                axisSize: MainAxisSize.max,
              ),
            ]).p16(),
          ),
        ).white.rounded.shadow2xl.make().p20(),
      ]).scrollVertical(),
    );
  }

  Widget _buildNameStep(RegisterViewModel viewModel) {
    return VStack([
      "Full Name".text.xl.bold.make(),
      TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your full name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: viewModel.setName,
        validator: (value) => viewModel.validateName(value),
      ),
    ]);
  }

  Widget _buildEmailStep(RegisterViewModel viewModel) {
    return VStack([
      "Email Address".text.xl.bold.make(),
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Enter your email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: viewModel.setEmail,
        validator: (value) => viewModel.validateEmail(value),
      ),
    ]);
  }

  Widget _buildPasswordStep(RegisterViewModel viewModel) {
    return VStack([
      "Password".text.xl.bold.make(),
      TextFormField(
        obscureText: !viewModel.isPasswordVisible,
        decoration: InputDecoration(
          hintText: "Enter password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: IconButton(
            icon: Icon(viewModel.isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: viewModel.togglePasswordVisibility,
          ),
        ),
        onChanged: viewModel.setPassword,
        validator: (value) => viewModel.validatePassword(value),
      ).py12(),
      TextFormField(
        obscureText: !viewModel.isPasswordVisible,
        decoration: InputDecoration(
          hintText: "Confirm password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: viewModel.setConfirmPassword,
        validator: (value) => viewModel.validateConfirmPassword(value),
      ),
    ]);
  }

  Widget _buildPhoneStep(RegisterViewModel viewModel) {
    return VStack([
      "Phone Number".text.xl.bold.make(),
      TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: "Enter your phone number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: viewModel.setPhone,
        validator: (value) => viewModel.validatePhone(value),
      ),
    ]);
  }

  void _handleNext(RegisterViewModel viewModel) {
    if (!_formKey.currentState!.validate()) return;

    if (viewModel.currentStepIndex == 3) {
      viewModel.register();
    } else {
      viewModel.nextStep();
    }
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
