// property_creation_view.dart
import 'dart:io';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mime/mime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/global/formatter.dart';
import 'package:real_estate_fe/ui/views/property_creation/property_creation_viewmodel.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/ui/widgets/common/image_thumbnail/image_thumbnail.dart';
import 'package:real_estate_fe/ui/widgets/common/image_upload_button/image_upload_button.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class PropertyCreationView extends StackedView<PropertyCreationViewModel> {
  @override
  Widget builder(BuildContext context, PropertyCreationViewModel viewModel,
      Widget? child) {
    return BasePage(
      showAppBar: true,
      title: "Create property",
      appBarColor: AppColors.primaryColor,
      body: FormBuilder(
          key: viewModel.formKey,
          child: Stack(children: [
            Visibility(
                visible: viewModel.currentStep == 0,
                maintainState: true,
                child: _buildBasicInfoStep(context, viewModel)),
            Visibility(
                visible: viewModel.currentStep == 1,
                child: _buildDescriptionStep(context, viewModel)),
            Visibility(
                visible: viewModel.currentStep == 2,
                maintainState: true,
                child: _buildLocationStep(context, viewModel)),
            Visibility(
                visible: viewModel.currentStep == 3,
                maintainState: true,
                child: _buildMediaStep(viewModel)),
            Visibility(
                visible: viewModel.currentStep == 4,
                maintainState: true,
                child: _buildReviewStep(viewModel)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildNavigationControls(viewModel))
          ])),
    );
  }

  Widget _buildBasicInfoStep(
      BuildContext context, PropertyCreationViewModel viewModel) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            name: 'title',
            decoration: const InputDecoration(labelText: 'Property Title'),
            validator: viewModel.validateTitle,
            maxLength: 100,
          ),
          const SizedBox(height: 16),
          HStack([
            FormBuilderDropdown<String>(
              name: 'property_category',
              items: (viewModel.propertyTypes ?? [])
                  .map((c) => DropdownMenuItem(
                        value: c.name,
                        child: Text(c.name.toUpperCase()),
                      ))
                  .toList(),
              initialValue: viewModel.propertyTypes?[0].name,
              decoration: const InputDecoration(labelText: 'Category'),
            ).expand(),
            UiSpacer.hSpace(),
            FormBuilderDropdown<String>(
              name: 'transaction_type',
              items: (["rent", "sale"])
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c.toUpperCase()),
                      ))
                  .toList(),
              initialValue: "rent",
              decoration: const InputDecoration(labelText: 'Type'),
            ).expand(),
          ]),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: 'price',
            keyboardType: TextInputType.number,
            inputFormatters: [
              VietnameseCurrencyInputFormatter(),
            ],
            decoration: const InputDecoration(labelText: 'Price'),
            valueTransformer: (text) {
              String cleanedText = text!.replaceAll(RegExp(r'[^\d.]'), '');
              return double.tryParse(cleanedText);
            },
          ),
          const SizedBox(height: 16),
          // Group Bedrooms and Bathrooms side-by-side
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'bedrooms',
                  decoration: const InputDecoration(
                    labelText: 'Bedrooms',
                  ),
                  keyboardType: TextInputType.number,
                  validator: viewModel.validateBedrooms,
                  valueTransformer: (text) {
                    String cleanedText =
                        text!.replaceAll(RegExp(r'[^\d.]'), '');
                    return int.tryParse(cleanedText);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FormBuilderTextField(
                  name: 'bathrooms',
                  decoration: const InputDecoration(
                    labelText: 'Bathrooms',
                  ),
                  keyboardType: TextInputType.number,
                  valueTransformer: (text) {
                    String cleanedText =
                        text!.replaceAll(RegExp(r'[^\d.]'), '');
                    return int.tryParse(cleanedText);
                  },
                  validator: viewModel.validateBathrooms,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Area field displayed full width
          FormBuilderTextField(
            name: 'sqm',
            decoration: const InputDecoration(
              labelText: 'Area (sqm)',
            ),
            keyboardType: TextInputType.number,
            validator: viewModel.validateArea,
            valueTransformer: (text) {
              String cleanedText = text!.replaceAll(RegExp(r'[^\d.]'), '');
              return double.tryParse(cleanedText);
            },
          ),
          UiSpacer.vSpace(),
        ],
      ),
    );
  }

  Widget _buildLocationStep(
      BuildContext context, PropertyCreationViewModel viewModel) {
    return VStack([
      "Location".tr().text.textStyle(AppTextStyle.h2TitleTextStyle()).make(),
      (viewModel.selectedLocation.address ?? "")
          .text
          .medium
          .center
          .makeCentered()
          .wFull(context)
          .p8()
          .backgroundColor(Vx.white),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: FlutterMap(
            mapController: viewModel.mapController, // Use the MapController
            options: MapOptions(
              center: viewModel.selectedLocation.point,
              zoom: 16.0,
              onTap: viewModel.onMapTap,
              interactiveFlags: InteractiveFlag.all &
                  ~InteractiveFlag
                      .rotate, // Enable all interactions except rotate
            ),

            children: [
              // Changed from layers to children
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                // Changed from MarkerLayerOptions to MarkerLayer
                markers: [
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: viewModel.selectedLocation.point,
                    builder: (ctx) =>
                        const Icon(Icons.location_pin, color: Vx.red500),
                  ),
                ],
              ),
            ],
          )),
      const SizedBox(height: 16),
      // New text fields for neighborhood, city, and street.
      FormBuilderTextField(
        name: 'neighborhood',
        initialValue: viewModel.neighborhood,
        decoration: const InputDecoration(labelText: 'Neighborhood'),
      ),
      const SizedBox(height: 16),
      FormBuilderTextField(
        name: 'city',
        initialValue: viewModel.city,
        decoration: const InputDecoration(labelText: 'City'),
      ),
      const SizedBox(height: 16),
      FormBuilderTextField(
        name: 'street',
        initialValue: viewModel.street,
        decoration: const InputDecoration(labelText: 'Street'),
      ),
    ]).p16();
  }

  Widget _buildMediaStep(PropertyCreationViewModel viewModel) {
    return VStack([
      "Images".tr().text.textStyle(AppTextStyle.h3TitleTextStyle()).make(),
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
            onRemove: () {
              viewModel.images.removeAt(index);
              viewModel.notifyListeners();
            },
          );
        },
      ).expand()
    ]).p16();
  }

// _buildReviewStep function updated with summary view
  Widget _buildReviewStep(PropertyCreationViewModel viewModel) {
    if (viewModel.formKey.currentState == null) return const SizedBox.shrink();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Review Details', style: AppTextStyle.h2TitleTextStyle()),
          _buildSummary(viewModel),
          "Images".tr().text.textStyle(AppTextStyle.h2TitleTextStyle()).make(),
          GridView.builder(
            shrinkWrap: true, // Let the GridView take only the needed height
            physics:
                const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: viewModel.images.length,
            itemBuilder: (context, index) {
              return ImageThumbnail(viewModel.images[index]);
            },
          ),
          'Submit Listing'
              .tr() // Apply translation
              .text // Convert to Text widget
              .bold
              .lg
              .color(Colors.white) // Set text color
              .makeCentered() // Center the text
              .box
              .color(AppColors.primaryColor) // Use grey color when disabled
              .rounded
              .width(double.infinity) // Make button full width
              .height(50)
              .make() // Create the styled box widget
              .onTap(viewModel.submitForm),
          UiSpacer.vSpace(10),
          'Edit'
              .tr() // Apply translation
              .text // Convert to Text widget
              .bold
              .lg
              .color(Colors.white) // Set text color
              .makeCentered() // Center the text
              .box
              .color(Vx.red700) // Use grey color when disabled
              .rounded
              .width(double.infinity) // Make button full width
              .height(50)
              .make() // Create the styled box widget
              .onTap(viewModel.previousStep),
        ],
      ),
    );
  }

// _buildSummary function
  Widget _buildSummary(PropertyCreationViewModel viewModel) {
    return VStack(
      [
        _buildSummaryItem('Title', viewModel.formValue('title')),
        _buildSummaryItem('Category', viewModel.formValue('property_category')),
        _buildSummaryItem('Price', viewModel.formValue('price')),
        _buildSummaryItem('Bedrooms', viewModel.formValue('bedrooms')),
        _buildSummaryItem('Bathrooms', viewModel.formValue('bathrooms')),
        _buildSummaryItem('SQM', viewModel.formValue('sqm')),
        _buildSummaryItem('Street', viewModel.formValue('street')),
        _buildSummaryItem('City', viewModel.formValue('city')),
        _buildSummaryItem('Description', viewModel.formValue('description')),
        if (viewModel.formValue('neighborhood') != null)
          _buildSummaryItem(
              'Neighborhood', viewModel.formValue('neighborhood')),
        _buildSummaryItem(
            'Address', (viewModel.selectedLocation.address ?? 0.0).toString()),
      ],
    ).py16().px12();
  }

// _buildSummaryItem function
  Widget _buildSummaryItem(String label, String? value) {
    if (value == null) return const SizedBox.shrink();
    return HStack(
      [
        label.text.gray600.textStyle(AppTextStyle.h4TitleTextStyle()).make(),
        ":".text.textStyle(AppTextStyle.h4TitleTextStyle()).make(),
        UiSpacer.hSpace(),
        value.text.make().expand(),
      ],
      crossAlignment: CrossAxisAlignment.start,
    ).py8();
  }

  Widget _buildNavigationControls(PropertyCreationViewModel viewModel) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (viewModel.currentStep > 0)
          FloatingActionButton(
            heroTag: 'back',
            onPressed: viewModel.previousStep,
            child: const Icon(Icons.arrow_back),
          )
        else
          Container(),
        FloatingActionButton(
          heroTag: 'next',
          onPressed: () => viewModel.nextStep(viewModel.formKey.currentState!),
          child: const Icon(Icons.arrow_forward),
        ),
      ],
    ).px16().py12();
  }

  _buildDescriptionStep(
      BuildContext context, PropertyCreationViewModel viewModel) {
    return VStack([
      Text("Description".tr(), style: AppTextStyle.h3TitleTextStyle()),
      QuillSimpleToolbar(
        controller: viewModel.descriptionController,
        config: const QuillSimpleToolbarConfig(),
      ),
      FormBuilderField<String>(
        // Use FormBuilderField
        name: 'description',
        builder: (FormFieldState<String> field) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuillEditor.basic(
                // Use the Quill Editor here
                controller: viewModel.descriptionController,
              ).expand(),
              if (field.hasError)
                Text(field.errorText!,
                    style: const TextStyle(
                      color: Vx.red400,
                    )),
            ],
          );
        },
        validator: (value) {
          return null;
        },
        onSaved: (value) {
          // Update the form value with the HTML from the editor.
          viewModel.formKey.currentState!.fields["description"]
              ?.didChange(viewModel.descriptionController.getPlainText());
        },
      ).h32(context).backgroundColor(Vx.gray300)
    ]).p16();
  }

  Uint8List loadData(String imagePath) {
    File file = File(imagePath);
    Uint8List bytes = file.readAsBytesSync();
    return bytes;
  }

  @override
  void onViewModelReady(PropertyCreationViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }

  @override
  PropertyCreationViewModel viewModelBuilder(BuildContext context) =>
      PropertyCreationViewModel();
}
