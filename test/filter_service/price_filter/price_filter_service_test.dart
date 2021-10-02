import 'package:flutter_test/flutter_test.dart';
import 'package:smash_fighters/app/modules/fighters/presenter/services/filter_service.dart';

import '../../original_fighter_list_mock.dart';
import 'price_filter_expected_responses.dart';
import 'price_filters_inputs_mock.dart';

void main() {
  late PriceFilterService priceFilter;

  setUp(() {
    priceFilter = const PriceFilterService();
  });

  test('should return the items inside a price range', () async {
    final result = priceFilter.filter(originalFighterListMock, priceRangeFilterMock);
    expect(result, priceRangeFighterListMock);
  });

  test('should return the items inside a price range containing the edge values', () async {
    final result = priceFilter.filter(originalFighterListMock, priceRangeEdgeValuesFilterMock);
    expect(result, priceRangeFighterListMock);
  });
}
