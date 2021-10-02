import 'package:flutter_test/flutter_test.dart';
import 'package:smash_fighters/app/modules/fighters/presenter/services/filter_service.dart';

import '../../original_fighter_list_mock.dart';
import 'stars_filter_expected_responses_mock.dart';
import 'stars_filters_inputs_mock.dart';

void main() {
  late StarsFilterService starsFilter;

  setUp(() {
    starsFilter = const StarsFilterService();
  });

  test('should return the items with two stars', () async {
    final result = starsFilter.filter(originalFighterListMock, twoStarsFilterMock);
    expect(result, twoStarsFighterListMock);
  });

  test('should return no items with three stars', () async {
    final result = starsFilter.filter(originalFighterListMock, threeStarsFilterMock);
    expect(result, threeStarsFighterListMock);
  });

  test('should return all items when receive no stars', () async {
    final result = starsFilter.filter(originalFighterListMock, zeroStarsFilterMock);
    expect(result, originalFighterListMock);
  });
}
