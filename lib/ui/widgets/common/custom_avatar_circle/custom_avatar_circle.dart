import 'package:flutter/material.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:stacked/stacked.dart';

import 'custom_avatar_circle_model.dart';

class CustomAvatarCircle extends StackedView<CustomAvatarCircleModel> {
  final User user;
  const CustomAvatarCircle({super.key, required this.user});

  @override
  Widget builder(
    BuildContext context,
    CustomAvatarCircleModel viewModel,
    Widget? child,
  ) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.grey[300],
      backgroundImage: user.profileImage?.url != null
          ? NetworkImage(user.profileImage!.url)
          : null,
      child: user.profileImage?.url == null
          ? Text(
              user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          : null,
    );
  }

  @override
  CustomAvatarCircleModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomAvatarCircleModel();
}
