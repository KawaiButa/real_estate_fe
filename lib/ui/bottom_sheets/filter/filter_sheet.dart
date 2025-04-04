import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/extensions/dynamic.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/ui/widgets/common/multi_select_chips/multi_select_chips.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HStack(
            [
              Text(
                'Bộ lọc tìm kiếm',
                style: AppTextStyle.h2TitleTextStyle(),
              ).expand(),
              IconButton(
                  onPressed: viewModel.removeAllFilter,
                  icon: const Icon(Icons.filter_alt_off_outlined))
            ],
            axisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.spaceBetween,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildPriceFilter(viewModel),
                  _buildPropertyTypeFilter(viewModel),
                  _buildBedBathFilter(viewModel),
                  _buildLocationFilter(viewModel),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => completer != null
                      ? completer!(SheetResponse(confirmed: false))
                      : null,
                  child: Text('Hủy', style: AppTextStyle.h4TitleTextStyle()),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () => completer != null
                      ? completer!(SheetResponse(
                          confirmed: true,
                          data: viewModel.filters,
                        ))
                      : null,
                  child: Text('Áp dụng',
                      style:
                          AppTextStyle.h4TitleTextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  FilterSheetModel viewModelBuilder(BuildContext context) =>
      FilterSheetModel(filterData: request.data as FilterCriteria);
  Widget _buildPriceFilter(FilterSheetModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Khoảng giá', style: AppTextStyle.h4TitleTextStyle()),
        RangeSlider(
          values: RangeValues(
            viewModel.filters.minPrice ?? 0,
            viewModel.filters.maxPrice ?? 10000000000,
          ),
          activeColor: AppColors.primaryColor,
          min: 0,
          max: 10000000000,
          divisions: 10,
          labels: RangeLabels(
            viewModel.filters.minPrice
                    ?.toStringAsFixed(0)
                    .currencyValueFormat() ??
                "0",
            viewModel.filters.maxPrice
                    ?.toStringAsFixed(0)
                    .currencyValueFormat() ??
                "",
          ),
          onChanged: (values) {
            viewModel.setFilter(viewModel.filters.copyWith(
              minPrice: values.start,
              maxPrice: values.end,
            ));
          },
        ),
      ],
    );
  }

  Widget _buildPropertyTypeFilter(FilterSheetModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loại hình', style: AppTextStyle.h4TitleTextStyle()),
        MultiSelectChips<PropertyType>(
          options: viewModel.propertyTypes ?? [].cast<PropertyType>(),
          formatToLabel: (dynamic data) => data.name,
          value: viewModel.propertyTypes!.firstOrNullWhere(
              (e) => e.name == viewModel.filters.propertyType),
          onSelect: (dynamic data, isSelected) => viewModel.setFilter(
              viewModel.filters.copyWith(
                  propertyType: (data as PropertyType).name ==
                          viewModel.filters.propertyType
                      ? null
                      : (data).name)),
        ),
      ],
    );
  }

  Widget _buildBedBathFilter(FilterSheetModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            value: viewModel.filters.minBedrooms,
            decoration: InputDecoration(
              labelText: 'Số phòng ngủ',
              labelStyle: AppTextStyle.h5TitleTextStyle(),
            ),
            items: List.generate(5, (i) => i)
                .map((i) => DropdownMenuItem(
                      value: i,
                      child: Text(i == 0 ? 'Tất cả' : '$i+'),
                    ))
                .toList(),
            onChanged: (value) => viewModel.setFilter(viewModel.filters =
                viewModel.filters.copyWith(minBedrooms: value)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<int>(
            value: viewModel.filters.minBathrooms,
            decoration: InputDecoration(
              labelText: 'Số phòng tắm',
              labelStyle: AppTextStyle.h5TitleTextStyle(),
            ),
            items: List.generate(5, (i) => i)
                .map((i) => DropdownMenuItem(
                      value: i,
                      child: Text(i == 0 ? 'Tất cả' : '$i+'),
                    ))
                .toList(),
            onChanged: (value) => viewModel.setFilter(viewModel.filters =
                viewModel.filters.copyWith(minBathrooms: value)),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationFilter(FilterSheetModel viewModel) {
    return DropdownButtonFormField<String>(
      value: viewModel.filters.provinceCode,
      decoration: InputDecoration(
        labelText: 'Tỉnh/Thành phố',
        labelStyle: AppTextStyle.h5TitleTextStyle(),
      ),
      items: [
        const DropdownMenuItem(
          value: null,
          child: Text('Tất cả địa điểm'),
        ),
        ...viewModel.provinces.map((province) => DropdownMenuItem(
              value: province.code,
              child: Text(province.name),
            )),
      ],
      onChanged: (value) => viewModel.setFilter(
          viewModel.filters = viewModel.filters.copyWith(provinceCode: value)),
    );
  }
}
