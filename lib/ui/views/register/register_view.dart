import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  final _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget builder(
      BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return BasePage(
      title: "Register".tr(),
      showAppBar: true,
      showLeadingAction: true,
      appBarColor: AppColors.primaryColor,
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: viewModel.currentStepIndex,
          onStepContinue: () => _handleNext(viewModel),
          onStepCancel: viewModel.previousStep,
          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (viewModel.currentStepIndex != 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Back'),
                  ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: details.onStepContinue,
                  child: Text(
                    viewModel.currentStepIndex == 3
                        ? "Register".tr()
                        : "Next".tr(),
                  ),
                ).pOnly(top: 10),
              ],
            );
          },
          steps: [
            Step(
              title: const Text("Full Name"),
              isActive: viewModel.currentStepIndex >= 0,
              content: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  labelText: "Enter your full name",
                  hintText: "Your complete name",
                  border: OutlineInputBorder(),
                ),
                onChanged: viewModel.setName,
                // Only validate if the current step is 0.
                validator: (value) {
                  if (viewModel.currentStepIndex != 0) return null;
                  return viewModel.validateName(value);
                },
              ),
            ),
            Step(
              title: const Text("Email"),
              isActive: viewModel.currentStepIndex >= 1,
              content: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  labelText: "Enter your email",
                  hintText: "example@mail.com",
                  border: OutlineInputBorder(),
                ),
                onChanged: viewModel.setEmail,
                // Only validate if the current step is 1.
                validator: (value) {
                  if (viewModel.currentStepIndex != 1) return null;
                  // Add requirement: valid email format.
                  return viewModel.validateEmail(value);
                },
              ),
            ),
            Step(
              title: const Text("Phone Number"),
              isActive: viewModel.currentStepIndex >= 2,
              content: TextFormField(
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  labelText: "Enter your phone number",
                  hintText: "e.g., +1234567890",
                  border: OutlineInputBorder(),
                ),
                onChanged: viewModel.setPhone,
                // Only validate if the current step is 2.
                validator: (value) {
                  if (viewModel.currentStepIndex != 2) return null;
                  // Add requirement: non-empty and properly formatted phone number.
                  return viewModel.validatePhone(value);
                },
              ),
            ),
            Step(
              title: const Text("Password"),
              isActive: viewModel.currentStepIndex >= 3,
              content: Column(
                children: [
                  TextFormField(
                    obscureText: !viewModel.isPasswordVisible,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      labelText: "Enter password",
                      hintText: "Minimum 8 characters",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          viewModel.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: viewModel.togglePasswordVisibility,
                      ),
                    ),
                    onChanged: viewModel.setPassword,
                    // Only validate if the current step is 3.
                    validator: (value) {
                      if (viewModel.currentStepIndex != 3) return null;
                      // Add requirement: password must not be empty and may need to be a minimum length.
                      return viewModel.validatePassword(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: !viewModel.isPasswordVisible,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      labelText: "Confirm password",
                      hintText: "Re-enter password",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: viewModel.setConfirmPassword,
                    // Only validate if the current step is 3.
                    validator: (value) {
                      if (viewModel.currentStepIndex != 3) return null;
                      // Add requirement: the confirmation must match the original password.
                      return viewModel.validateConfirmPassword(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
