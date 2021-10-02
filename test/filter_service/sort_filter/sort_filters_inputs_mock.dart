import 'package:smash_fighters/app/modules/fighters/domain/entities/filter_entity.dart';
import 'package:smash_fighters/app/modules/fighters/domain/entities/universe_entity.dart';
import 'package:smash_fighters/app/modules/fighters/presenter/services/sort_enum.dart';

final ascendingFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Ascending,
  priceMin: null,
  priceMax: null,
  stars: null,
);
final descendingFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Descending,
  priceMin: null,
  priceMax: null,
  stars: null,
);
final rateFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Rate,
  priceMin: null,
  priceMax: null,
  stars: null,
);
final downloadsFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Downloads,
  priceMin: null,
  priceMax: null,
  stars: null,
);
