import '../../presenter/services/sort_enum.dart';
import 'universe_entity.dart';

class FilterEntity {
  final UniverseEntity universe;
  final SortEnum sortBy;
  final double? priceMin;
  final double? priceMax;
  final int? stars;
  bool get isInitial => this == FilterEntity.empty();

  FilterEntity({
    required this.universe,
    required this.sortBy,
    required this.priceMin,
    required this.priceMax,
    required this.stars,
  });

  FilterEntity.empty()
      : universe = UniverseEntity.all(),
        sortBy = SortEnum.Ascending,
        priceMin = null,
        priceMax = null,
        stars = null;

  FilterEntity copyWith({
    UniverseEntity? universe,
    SortEnum? sortBy,
    double? priceMin,
    double? priceMax,
    int? stars,
  }) {
    return FilterEntity(
      universe: universe ?? this.universe,
      sortBy: sortBy ?? this.sortBy,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      stars: stars ?? this.stars,
    );
  }

  FilterEntity copyWithStars(int? stars) {
    return FilterEntity(
      universe: universe,
      sortBy: sortBy,
      priceMin: priceMin,
      priceMax: priceMax,
      stars: stars,
    );
  }

  FilterEntity copyWithPrice({required double priceMin, required double priceMax}) {
    return FilterEntity(
      universe: universe,
      sortBy: sortBy,
      priceMin: priceMin,
      priceMax: priceMax,
      stars: stars,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FilterEntity &&
        other.sortBy == sortBy &&
        other.priceMin == priceMin &&
        other.priceMax == priceMax &&
        other.stars == stars;
  }

  @override
  int get hashCode {
    return universe.hashCode ^ sortBy.hashCode ^ priceMin.hashCode ^ priceMax.hashCode ^ stars.hashCode;
  }
}
