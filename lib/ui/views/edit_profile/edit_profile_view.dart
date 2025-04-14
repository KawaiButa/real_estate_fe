import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/views/edit_profile/edit_profile_viewmodel.dart';
import 'package:stacked/stacked.dart'; // Import Stacked
import 'package:velocity_x/velocity_x.dart'; // Import VelocityX

class EditProfileView extends StackedView<EditProfileViewModel> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel, // Use the ViewModel
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: "Edit Profile".text.make(), // Use VelocityX for title text
        elevation: 1,
      ),
      // Use a loading overlay if the ViewModel is busy (e.g., saving)
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              // Keep SingleChildScrollView for keyboard handling
              child: VStack(
                // Use VStack for the main column layout
                [
                  // --- Profile Image Section ---
                  ZStack(
                    // Use ZStack for layering image and button
                    [
                      // Profile Image Avatar using VxBox or Image.network
                      viewModel.selectedImageFile == null
                          ? Image.network(
                              viewModel.user?.profileImage!.url ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image,
                                          size: 60, color: Vx.gray400)
                                      .box
                                      .color(Vx.gray200)
                                      .width(130)
                                      .height(130)
                                      .roundedFull
                                      .makeCentered(),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const CircularProgressIndicator()
                                    .box
                                    .width(130)
                                    .height(130)
                                    .roundedFull
                                    .alignCenter
                                    .make();
                              },
                            )
                              .box
                              .width(130)
                              .height(130)
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make()
                          : const Icon(
                              Icons.person,
                              size: 70,
                              color: Vx.gray400,
                            )
                              .box
                              .color(Vx.gray200)
                              .width(130)
                              .height(130)
                              .roundedFull
                              .make(),

                      IconButton(
                        icon: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 20),
                        tooltip: 'Change profile picture',
                        padding: EdgeInsets.zero, // Remove default padding
                        constraints: const BoxConstraints(),
                        // Call ViewModel method
                        onPressed: viewModel.changeProfileImage,
                      )
                          .box // Wrap IconButton in VxBox for styling
                          .color(
                              Theme.of(context).primaryColor) // Use theme color
                          .p4 // Padding inside the circle
                          .roundedFull // Make the button background circular
                          .border(color: Colors.white, width: 2) // White border
                          .make()
                          .positioned(
                            // Position explicitly if alignment is tricky
                            bottom: 0,
                            right: 0,
                          ),
                    ],
                    alignment: Alignment.center, // Center image by default
                  ),
                  32.heightBox, // Spacing using VelocityX extension

                  // --- Username Field ---
                  // Keep standard TextFormField for form handling capabilities
                  TextFormField(
                    controller: viewModel.usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  20.heightBox, // Spacing

                  TextFormField(
                    controller: viewModel.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  40.heightBox,
                  "Save Changes"
                      .text
                      .white // Text color
                      .size(16) // Text size
                      .makeCentered() // Center text in the box
                      .box
                      .rounded
                      .color(AppColors.primaryColor)
                      .width(double.infinity)
                      .height(100)
                      .make()
                      .px12()
                      .onTap(viewModel.saveProfile),
                ],
                crossAlignment: CrossAxisAlignment.center,
              ).p(24),
            ),
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(BuildContext context) =>
      EditProfileViewModel();
  @override
  void onViewModelReady(EditProfileViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
