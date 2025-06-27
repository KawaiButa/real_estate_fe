import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/tourview_floor.dart';
import 'package:real_estate_fe/models/tourview_room.dart';
import 'package:real_estate_fe/services/alert_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RoomLocation {
  RoomLocation(this.position, {this.currentRoom, this.parent, this.direction});
  TourviewRoom? parent;
  TourviewRoom? currentRoom;
  String? direction;
  Offset position;
}

class NewTourviewViewModel extends BaseViewModel {
  List<TourviewRoom> rooms = [];
  List<Widget> widgets = [];
  double panelWidth = 3000;
  double panelHeight = 3000;
  final _navigationService = locator<NavigationService>();
  initialise({List<TourviewFloor>? floors}) {
    notifyListeners();
  }

  handleAddRoom() async {
    _navigationService.navigateToGuidePanoramaView();
  }
}
