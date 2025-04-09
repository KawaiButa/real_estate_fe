import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/filter_criteria.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/models/province.dart';
import 'package:real_estate_fe/services/property_type_service.dart';
import 'package:stacked/stacked.dart';

class FilterSheetModel extends BaseViewModel {
  List<Province> provinces = [];
  final _propertyTypeService = locator<PropertyTypeService>();
  List<PropertyType>? get propertyTypes => _propertyTypeService.data;
  late FilterCriteria filters;

  var maxPriceController;

  var minPriceController;
  FilterSheetModel({required FilterCriteria filterData}) {
    filters = filterData;
  }

  initialise() async {
    try {
      setBusyForObject(_propertyTypeService, true);
      await _propertyTypeService.fetchPropertyTypes();
    } finally {
      setBusyForObject(_propertyTypeService, false);
      notifyListeners();
    }
  }

  void setFilter(FilterCriteria filterData) {
    filters = filterData;
    notifyListeners();
  }

  void removeAllFilter() {
    filters = const FilterCriteria();
  }
}
