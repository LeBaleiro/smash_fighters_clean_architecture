import 'package:flutter_test/flutter_test.dart';
import 'package:smash_fighters/app/modules/fighters/presenter/services/filter_service.dart';

import '../../original_fighter_list_mock.dart';
import 'sort_filter_expected_responses_mock.dart';
import 'sort_filters_inputs_mock.dart';

void main() {
  late SortFilterService sortFilter;

  setUp(() {
    sortFilter = const SortFilterService();
  });

  test('should return the items in ascending order', () async {
    final result = sortFilter.filter(originalFighterListMock, ascendingFilterMock);
    expect(result, ascendingOrderFighterListMock);
  });
  test('should return the items in descending order', () async {
    final result = sortFilter.filter(originalFighterListMock, descendingFilterMock);
    expect(result, descendingOrderFighterListMock);
  });
  test('should return the items in rate order', () async {
    final result = sortFilter.filter(originalFighterListMock, rateFilterMock);
    expect(result, rateOrderFighterListMock);
  });
  test('should return the items in downloads order', () async {
    final result = sortFilter.filter(originalFighterListMock, downloadsFilterMock);
    expect(result, downloadsOrderFighterListMock);
  });
}
