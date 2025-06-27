import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:stacked/stacked.dart';

import 'guest_viewmodel.dart';

class GuestView extends StackedView<GuestViewModel> {
  const GuestView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GuestViewModel viewModel,
    Widget? child,
  ) {
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

  @override
  GuestViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GuestViewModel();
}
