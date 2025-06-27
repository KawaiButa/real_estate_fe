import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/models/tourview_room.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_button/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'tourview_room_button_model.dart';

class TourviewRoomButton extends StackedView<TourviewRoomButtonModel> {
  const TourviewRoomButton(this.room, {super.key});
  final TourviewRoom room;
  @override
  Widget builder(
    BuildContext context,
    TourviewRoomButtonModel viewModel,
    Widget? child,
  ) {
    return VStack([
      HStack([
        room.title.tr().text.xl3.bold.make().expand(),
        CustomButton(
          text: "Done",
          height: 30,
          width: 60,
          borderRadius: 20,
          onTap: viewModel.requestNewTourView,
        )
      ]),
      VxSwiper.builder(
        aspectRatio: 16 / 9,
        itemCount: room.images.length,
        itemBuilder: (context, index) {
          final image = room.images[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.fitWidth,
              ),
            ),
            margin: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).wFull(context),
      const Divider()
    ]);
  }

  @override
  TourviewRoomButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      TourviewRoomButtonModel();
}
