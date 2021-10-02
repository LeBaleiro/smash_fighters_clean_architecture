import 'package:smash_fighters/app/modules/fighters/domain/entities/filter_entity.dart';
import 'package:smash_fighters/app/modules/fighters/domain/entities/universe_entity.dart';
import 'package:smash_fighters/app/modules/fighters/presenter/services/sort_enum.dart';

final priceRangeFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Ascending,
  priceMin: 1,
  priceMax: 3,
  stars: null,
);
final priceRangeEdgeValuesFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Ascending,
  priceMin: 1,
  priceMax: 2,
  stars: null,
);
