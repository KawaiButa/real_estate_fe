import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/ui/widgets/common/multi_select_chips/multi_select_chips.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'filter_sheet_model.dart';

class FilterSheet extends StackedView<FilterSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const FilterSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    FilterSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      // Increased padding for better spacing
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Slightly larger radius
          topRight: Radius.circular(20),
        ),
      ),
      // Use LayoutBuilder for potentially responsive height
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min, // Takes minimum space needed
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10.0), // Add padding below header
              child: Row(
                // Use Row instead of HStack for standard Flutter widgets
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bộ lọc tìm kiếm',
                    style: AppTextStyle.h2TitleTextStyle(),
                  ),
                  // Removed IconButton background for cleaner look
                  IconButton(
                    onPressed: viewModel.removeAllFilter,
                    icon: Icon(Icons.filter_alt_off_outlined,
                        color: AppColors.primaryColor), // Use primary color
                    tooltip: 'Xóa bộ lọc', // Add tooltip
                  )
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[300]), // Add a subtle divider
            const SizedBox(height: 16),

            // Scrollable Filter Options
            Flexible(
              // Use Flexible instead of Expanded for Column inside Column
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align titles to the left
                  children: [
                    _buildPriceFilter(viewModel, context), // Pass context
                    const SizedBox(height: 20), // Increased spacing
                    _buildPropertyTypeFilter(viewModel),
                    const SizedBox(height: 20), // Increased spacing
                    _buildBedBathFilter(viewModel),
                    const SizedBox(height: 20), // Increased spacing
                    // _buildLocationFilter(viewModel), // Assuming you have this
                    // const SizedBox(height: 16), // Spacing before buttons
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16), // Spacing before buttons

            // Action Buttons Section
            Divider(height: 1, color: Colors.grey[300]), // Add a subtle divider
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0), // Add padding above buttons
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      // Use OutlinedButton for secondary action
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryColor, // Text color
                        side: BorderSide(
                            color: AppColors.primaryColor), // Border color
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), // Rounded corners
                        padding: const EdgeInsets.symmetric(
                            vertical: 12), // Button padding
                      ),
                      onPressed: () =>
                          completer?.call(SheetResponse(confirmed: false)),
                      child: Text('Hủy',
                          style: AppTextStyle.h4TitleTextStyle(
                              color: AppColors.primaryColor)),
                    ),
                  ),
                  const SizedBox(width: 16), // Spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8)), // Rounded corners
                        padding: const EdgeInsets.symmetric(
                            vertical: 12), // Button padding
                      ),
                      onPressed: () {
                        // Optionally add validation here before confirming
                        completer?.call(SheetResponse(
                          confirmed: true,
                          data: viewModel.filters,
                        ));
                      },
                      child: Text('Áp dụng',
                          style: AppTextStyle.h4TitleTextStyle(
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  FilterSheetModel viewModelBuilder(BuildContext context) =>
      FilterSheetModel(filterData: request.data as FilterCriteria);

  // --- Updated Price Filter ---
  Widget _buildPriceFilter(FilterSheetModel viewModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Khoảng giá (VNĐ)', style: AppTextStyle.h4TitleTextStyle()),
        const SizedBox(height: 12), // Add space before text fields
        Row(
          children: [
            // Minimum Price Input
            Expanded(
              child: TextField(
                controller: viewModel.minPriceController,
                keyboardType: TextInputType.number,
                // Allow only digits
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Từ',
                  hintText: 'VD: 500000000', // Example hint
                  labelStyle:
                      AppTextStyle.h5TitleTextStyle(color: Colors.grey[600]),
                  // Clean border style
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 1.5),
                  ),
                  // Remove counter text
                  counterText: "",
                  // Add some padding inside
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
            ),
            const SizedBox(width: 12), // Space between fields
            // Maximum Price Input
            Expanded(
              child: TextField(
                controller: viewModel.maxPriceController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Đến',
                  hintText: 'VD: 2000000000', // Example hint
                  labelStyle:
                      AppTextStyle.h5TitleTextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 1.5),
                  ),
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  // suffixText: 'VNĐ',
                  // suffixStyle: TextStyle(color: Colors.grey),
                ),
                // maxLength: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- Property Type Filter (Minor style adjustments) ---
  Widget _buildPropertyTypeFilter(FilterSheetModel viewModel) {
    // Ensure propertyTypes is not null before accessing
    final types = viewModel.propertyTypes ?? [];
    if (types.isEmpty) {
      return const SizedBox.shrink(); // Don't show if no types
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loại hình', style: AppTextStyle.h4TitleTextStyle()),
        const SizedBox(height: 8), // Add space
        MultiSelectChips<PropertyType>(
          options: types,
          formatToLabel: (dynamic data) => (data as PropertyType).name,
          // Find the selected type based on name comparison
          value: types.firstOrNullWhere(
              (e) => e.name == viewModel.filters.propertyType),
          onSelect: (dynamic data, bool isSelected) {
            final selectedType = data as PropertyType;
            final newTypeValue = isSelected ? selectedType.name : null;
            viewModel.setFilter(
                viewModel.filters.copyWith(propertyType: newTypeValue));
          },
          selectedChipColor: AppColors.primaryColor,
          selectedTextColor: Colors.white,
          unselectedChipColor: Colors.grey[200],
          unselectedTextColor: Colors.black87,
        ),
      ],
    );
  }

  // --- Bed/Bath Filter (Minor style adjustments) ---
  Widget _buildBedBathFilter(FilterSheetModel viewModel) {
    // Helper function for dropdown items
    List<DropdownMenuItem<int>> buildDropDownItems(int maxCount) {
      return List.generate(maxCount + 1, (i) => i)
          .map((i) => DropdownMenuItem(
                value: i,
                // Display 'Any' or 'Tất cả' for 0
                child: Text(i == 0 ? 'Tất cả' : '$i+',
                    style: AppTextStyle.bodyTextStyle()),
              ))
          .toList();
    }

    // Helper function for InputDecoration
    InputDecoration buildInputDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.h5TitleTextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );
    }

    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            // Use 0 as the default/placeholder value if null
            value: viewModel.filters.minBedrooms ?? 0,
            decoration: buildInputDecoration('Phòng ngủ'),
            items: buildDropDownItems(5), // Max 5 bedrooms shown as 5+
            onChanged: (value) {
              // Treat 0 as null (meaning 'any') when setting filter
              viewModel.setFilter(viewModel.filters
                  .copyWith(minBedrooms: value == 0 ? null : value));
            },
            // Style the dropdown itself
            iconEnabledColor: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: viewModel.filters.minBathrooms ?? 0,
            decoration: buildInputDecoration('Phòng tắm'),
            items: buildDropDownItems(5), // Max 5 bathrooms shown as 5+
            onChanged: (value) {
              viewModel.setFilter(viewModel.filters
                  .copyWith(minBathrooms: value == 0 ? null : value));
            },
            iconEnabledColor: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
