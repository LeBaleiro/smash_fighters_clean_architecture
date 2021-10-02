import 'dart:math';

import '../../domain/entities/fighter_entity.dart';
import '../../domain/entities/filter_entity.dart';
import '../../domain/entities/universe_entity.dart';

class FightersState {
  final FilterEntity filters;
  final List<FighterEntity>? fighters;
  final List<UniverseEntity> universes;
  final List<FighterEntity>? filteredFighters;
  double get minPrice => fighters?.map((fighter) => fighter.price).reduce((a, b) => min(a, b)) ?? 0;
  double get maxPrice => fighters?.map((fighter) => fighter.price).reduce((a, b) => max(a, b)) ?? 0;

  FightersState({
    required this.filters,
    required this.fighters,
    required this.universes,
    required this.filteredFighters,
  });
  FightersState.initial()
      : filters = FilterEntity.empty(),
        fighters = null,
        universes = [UniverseEntity.all()],
        filteredFighters = null;

  FightersState copyWith({
    FilterEntity? filters,
    List<FighterEntity>? fighters,
    List<UniverseEntity>? universes,
    List<FighterEntity>? filteredFighters,
  }) {
    return FightersState(
      filters: filters ?? this.filters,
      fighters: fighters ?? this.fighters,
      universes: universes ?? this.universes,
      filteredFighters: filteredFighters ?? this.filteredFighters,
    );
  }
}
