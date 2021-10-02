import 'package:smash_fighters/app/modules/fighters/domain/entities/filter_entity.dart';
import 'package:smash_fighters/app/modules/fighters/domain/entities/universe_entity.dart';
import 'package:smash_fighters/app/modules/fighters/presenter/services/sort_enum.dart';

final twoStarsFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Ascending,
  priceMin: null,
  priceMax: null,
  stars: 2,
);
final threeStarsFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Ascending,
  priceMin: null,
  priceMax: null,
  stars: 3,
);
final zeroStarsFilterMock = FilterEntity(
  universe: UniverseEntity(objectId: 'universeObjectId1', name: 'Universo1', description: 'universeDescription1'),
  sortBy: SortEnum.Ascending,
  priceMin: null,
  priceMax: null,
  stars: null,
);
