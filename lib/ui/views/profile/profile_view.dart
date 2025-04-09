import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_image/custom_image.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProfileViewModel viewModel, Widget? child) {
    final screenHeight = MediaQuery.of(context).size.height;

    return viewModel.isLoggedIn
        ? _buildLoggedInView(viewModel, screenHeight)
        : _buildGuestView(viewModel);
  }

  Widget _buildLoggedInView(ProfileViewModel viewModel, double screenHeight) {
    return Column(
      children: [
        Stack(
          children: [
            // Background Gradient
            Container(
              height: screenHeight * 0.3,
              decoration: BoxDecoration(color: AppColors.primaryColor),
            ),

            // User Information
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Profile Avatar
                  if (viewModel.user?.profileImage?.url != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.highlightColor,
                      child: CustomImage(
                        imageUrl: viewModel.user!.profileImage?.url ?? "",
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 16),
                  // User Name
                  Text(
                    viewModel.user!.name,
                    style: AppTextStyle.h2TitleTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // User Email
                  Text(
                    viewModel.user!.email,
                    style: AppTextStyle.h5TitleTextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: viewModel.profileOptions.length,
            separatorBuilder: (context, index) => Divider(
              color: AppColors.faintBgColor,
              height: 1,
            ),
            itemBuilder: (context, index) => _buildProfileOption(
              viewModel.profileOptions[index],
              viewModel,
            ),
          ),
        ),
        _buildLogoutButton(viewModel),
      ],
    );
  }

  Widget _buildGuestView(ProfileViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Vui lòng đăng nhập để tiếp tục',
            style: AppTextStyle.h3TitleTextStyle(
              color: AppColors.primaryColorDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: viewModel.navigateToLogin,
            child: Text(
              'Đăng nhập',
              style: AppTextStyle.h4TitleTextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: viewModel.navigateToRegister,
            child: Text(
              'Chưa có tài khoản? Đăng ký ngay',
              style: AppTextStyle.h5TitleTextStyle(
                color: AppColors.accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(ProfileViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: viewModel.logout,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Đăng xuất',
              style: AppTextStyle.h4TitleTextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(ProfileOption option, ProfileViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.handleOptionTap(option),
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        leading: Icon(option.icon, color: AppColors.primaryColor),
        title: Text(
          option.title,
          style: AppTextStyle.h4TitleTextStyle(
            color: AppColors.primaryColorDark,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
