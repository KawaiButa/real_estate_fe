// partner_registration_view.dart
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/partner_registration.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'partner_registration_viewmodel.dart';

class PartnerRegistrationView
    extends StackedView<PartnerRegistrationViewModel> {
  final _formKey = GlobalKey<FormState>();

  PartnerRegistrationView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, PartnerRegistrationViewModel viewModel,
      Widget? child) {
    return BasePage(
      title: "Partner Registration".tr(),
      showAppBar: true,
      body: Form(
        key: _formKey,
        child: VStack([
          _buildProfileImageSection(viewModel),
          _buildTypeSelection(viewModel),
          _buildDateOfBirthField(context, viewModel),
          if (viewModel.selectedType == PartnerType.Enterprise)
            _buildEnterpriseFields(viewModel),
          _buildSubmitButton(context, viewModel),
        ]).p16().scrollVertical(),
      ),
    );
  }

  Widget _buildProfileImageSection(PartnerRegistrationViewModel viewModel) {
    return VStack([
      "Profile Image".text.lg.semiBold.make().py8(),
      GestureDetector(
        onTap: () => viewModel.pickProfileImage(),
        child: VxBox(
          child: viewModel.profileImage != null
              ? Image.file(viewModel.profileImage!, fit: BoxFit.cover)
              : const Icon(Icons.add_a_photo, color: Vx.gray600, size: 40),
        ).size(120, 120).make().centered(),
      ),
    ]).py12();
  }

  Widget _buildTypeSelection(PartnerRegistrationViewModel viewModel) {
    return VxBox(
      child: Column(
        children: [
          "Account Type".text.lg.semiBold.make().py8(),
          RadioListTile<PartnerType>(
            title: "Individual".text.make(),
            value: PartnerType.Individual,
            groupValue: viewModel.selectedType,
            onChanged: viewModel.setPartnerType,
          ),
          RadioListTile<PartnerType>(
            title: "Enterprise".text.make(),
            value: PartnerType.Enterprise,
            groupValue: viewModel.selectedType,
            onChanged: viewModel.setPartnerType,
          ),
        ],
      ),
    ).white.rounded.shadowXs.p16.make().py12();
  }

  Widget _buildDateOfBirthField(
      BuildContext context, PartnerRegistrationViewModel viewModel) {
    return VxBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Date of ${viewModel.selectedType == PartnerType.Individual ? 'Birth' : 'Foundation'}"
              .text
              .lg
              .semiBold
              .make()
              .py8(),
          TextFormField(
            readOnly: true,
            controller: viewModel.dateController,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.calendar_today),
              hintText: 'Select date',
              border: OutlineInputBorder(),
            ),
            onTap: () => viewModel.selectDate(context),
            validator: (value) => viewModel.validateDate(value),
          ),
        ],
      ),
    ).white.rounded.shadowXs.p16.make().py12();
  }

  Widget _buildEnterpriseFields(PartnerRegistrationViewModel viewModel) {
    return VStack([
      _buildCertificationImages(viewModel),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Authorized Representative Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) => viewModel.validateRepresentativeName(value),
        onChanged: viewModel.setRepresentativeName,
      ).py12(),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Tax Identification Number',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) => viewModel.validateTaxId(value),
        onChanged: viewModel.setTaxId,
      ).py12(),
    ]);
  }

  Widget _buildCertificationImages(PartnerRegistrationViewModel viewModel) {
    return VStack([
      "Business Registration Certificates".text.lg.semiBold.make().py8(),
      "Upload at least one certificate".text.sm.gray600.make(),
      HStack([
        ...viewModel.certificationImages.map((image) => Stack(
              children: [
                Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () => viewModel.removeCertificateImage(image),
                  ),
                ),
              ],
            )),
        _buildAddCertificateButton(viewModel),
      ]).scrollHorizontal(),
    ]).py12();
  }

  Widget _buildAddCertificateButton(PartnerRegistrationViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.pickCertificateImages(),
      child: VxBox(
        child: const Icon(Icons.add, color: Vx.gray600, size: 30),
      ).size(100, 100).border(color: Vx.gray400).roundedLg.make().p8(),
    );
  }

  Widget _buildSubmitButton(
      BuildContext context, PartnerRegistrationViewModel viewModel) {
    return viewModel.isBusy
        ? const CircularProgressIndicator().centered().py16()
        : "Submit Registration"
            .text
            .white
            .bold
            .xl
            .center
            .make()
            .onTap(() {
              if (_formKey.currentState!.validate()) {
                viewModel.submitRegistration();
              }
            })
            .p16()
            .box
            .rounded
            .color(AppColors.primaryColorDark)
            .make()
            .wFull(context);
  }

  @override
  PartnerRegistrationViewModel viewModelBuilder(BuildContext context) =>
      PartnerRegistrationViewModel();
}
