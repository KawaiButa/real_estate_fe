import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_fe/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BusyIndicatorModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
