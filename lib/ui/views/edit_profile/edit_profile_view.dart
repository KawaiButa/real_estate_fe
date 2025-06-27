import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/views/edit_profile/edit_profile_viewmodel.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_image/custom_image.dart';
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
                [
                  ZStack(
                    [
                      viewModel.selectedImageFile == null
                          ? (viewModel.user?.profileImage == null
                                  ? const SizedBox.shrink()
                                  : CustomImage(
                                      imageUrl:
                                          viewModel.user?.profileImage!.url,
                                      boxFit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.broken_image,
                                                      size: 60,
                                                      color: Vx.gray400)
                                                  .box
                                                  .color(Vx.gray200)
                                                  .width(130)
                                                  .height(130)
                                                  .roundedFull
                                                  .makeCentered(),
                                    ))
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
                            color: Colors.white, size: 15),
                        tooltip: 'Change profile picture',
                        padding: EdgeInsets.zero, // Remove default padding
                        constraints: const BoxConstraints(),
                        onPressed: viewModel.changeProfileImage,
                      )
                          .box
                          .color(
                              Theme.of(context).primaryColor) // Use theme color
                          .p4
                          .roundedFull
                          .border(color: Colors.white, width: 2)
                          .make()
                          .positioned(
                            bottom: -10,
                            right: -10,
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
                      .bold
                      .xl
                      .white // Text color
                      .size(16) // Text size
                      .makeCentered() // Center text in the box
                      .box
                      .rounded
                      .color(AppColors.primaryColor)
                      .width(double.infinity)
                      .height(50)
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
