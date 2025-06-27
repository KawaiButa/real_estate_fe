import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/ui/common/app_colors.dart';
import 'package:real_estate_fe/ui/common/ui_helpers.dart';
import 'package:real_estate_fe/ui/widgets/common/image_thumbnail/image_thumbnail.dart';
import 'package:real_estate_fe/ui/widgets/common/image_upload_button/image_upload_button.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'create_room_dialog_model.dart';

const double _graphicSize = 60;

class CreateRoomDialog extends StackedView<CreateRoomDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CreateRoomDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateRoomDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        child: VStack([
          "Create room"
              .tr()
              .text
              .white
              .center
              .bold
              .xl2
              .makeCentered()
              .box
              .width(double.infinity)
              .height(50)
              .color(AppColors.primaryColor)
              .make(),
          VStack([
            TextFormField(
              controller: viewModel.controller,
              decoration: InputDecoration(hintText: "Room's name".tr()),
            ),
            UiSpacer.vSpace(),
            "Select images".tr().text.bold.xl2.make(),
            GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: viewModel.images.length + 1,
              itemBuilder: (context, index) {
                if (index == viewModel.images.length) {
                  return ImageUploadButton(viewModel.pickImages);
                }
                return ImageThumbnail(
                  viewModel.images[index],
                  width: _graphicSize,
                  height: _graphicSize,
                  onRemove: () {
                    viewModel.images.removeAt(index);
                    viewModel.notifyListeners();
                  },
                );
              },
            ).expand(),
            "Done"
                .tr()
                .text
                .bold
                .lg
                .color(Vx.white)
                .makeCentered()
                .box
                .color(AppColors.primaryColor)
                .rounded
                .width(context.screenWidth)
                .height(50)
                .make()
                .pOnly(top: 8)
                .onTap(viewModel.onComplete),
          ]).p20().expand(),
        ]).hHalf(context));
  }

  @override
  CreateRoomDialogModel viewModelBuilder(BuildContext context) =>
      CreateRoomDialogModel();
}
