import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/services/app_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class AlertService {
  //
  Future<bool> showConfirm({
    String? title,
    String? text,
    String cancelBtnText = "Cancel",
    String confirmBtnText = "Ok",
    Function? onConfirm,
  }) async {
    //
    bool result = false;

    await AwesomeDialog(
        context: StackedService.navigatorKey!.currentContext!,
        dialogType: DialogType.question,
        title: title,
        desc: text,
        btnCancelText: cancelBtnText.tr(),
        btnOkText: confirmBtnText.tr(),
        showCloseIcon: false,
        btnCancelOnPress: () {
          if (onConfirm == null) {
            result = true;
            Navigator.pop(StackedService.navigatorKey!.currentContext!);
          } else {
            onConfirm();
          }
        }).show();

    //
    return result;
  }

  Future<bool> success({
    String? title,
    String? text,
    String cancelBtnText = "Cancel",
    String confirmBtnText = "Ok",
  }) async {
    //
    bool result = false;

    await AwesomeDialog(
        context: StackedService.navigatorKey!.currentContext!,
        dialogType: DialogType.success,
        title: title,
        desc: text,
        btnOkText: confirmBtnText.tr(),
        btnCancelText: cancelBtnText.tr(),
        showCloseIcon: true,
        btnOkOnPress: () {
          result = true;
        }).show();

    //
    return result;
  }

  Future<bool> error({
    String? title,
    String? text,
    String confirmBtnText = "Ok",
  }) async {
    //
    bool result = false;

    await AwesomeDialog(
        context: StackedService.navigatorKey!.currentContext!,
        dialogType: DialogType.error,
        title: title,
        desc: text,
        btnOkText: confirmBtnText.tr(),
        showCloseIcon: true,
        btnOkOnPress: () {
          result = true;
        }).show();

    //
    return result;
  }

  Future<bool> warning({
    String? title,
    String? text,
    String confirmBtnText = "Ok",
  }) async {
    //
    bool result = false;

    await AwesomeDialog(
        context: StackedService.navigatorKey!.currentContext!,
        dialogType: DialogType.warning,
        title: title,
        desc: text,
        btnOkText: confirmBtnText.tr(),
        showCloseIcon: true,
        btnOkOnPress: () {
          result = true;
        }).show();

    //
    return result;
  }

  void showLoading() {
    AwesomeDialog(
            context: StackedService.navigatorKey!.currentContext!,
            dialogType: DialogType.info,
            body: const CircularProgressIndicator().centered().w(100).h(200))
        .show();
  }

  void stopLoading() {
    Navigator.pop(StackedService.navigatorKey!.currentContext!);
  }
}
