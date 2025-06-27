import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';

import 'vertical_capture_viewmodel.dart';

class VerticalCaptureView extends StackedView<VerticalCaptureViewModel> {
  const VerticalCaptureView({Key? key}) : super(key: key);

  @override
  VerticalCaptureViewModel viewModelBuilder(BuildContext context) =>
      VerticalCaptureViewModel();

  @override
  void onViewModelReady(VerticalCaptureViewModel viewModel) => viewModel.init();

  @override
  Widget builder(
    BuildContext context,
    VerticalCaptureViewModel vm,
    Widget? child,
  ) {
    if (vm.controller == null || !vm.controller!.value.isInitialized) {
      return BasePage(
        showAppBar: true,
        title: "Vertical Capture".tr(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return BasePage(
      showAppBar: true,
      title: vm.isUpCaptured ? 'Capture Downward' : 'Capture Upward',
      body: Stack(
        children: [
          CameraPreview(vm.controller!),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: vm.capture,
                child: const Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
