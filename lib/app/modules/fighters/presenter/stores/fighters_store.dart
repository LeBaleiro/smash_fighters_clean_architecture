import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/filter_entity.dart';
import '../../domain/entities/universe_entity.dart';
import '../../domain/use_cases/get_fighters_use_case.dart';
import '../../domain/use_cases/get_universes_use_case.dart';
import '../services/filter_service.dart';
import '../states/fighters_state.dart';

export '../states/fighters_state.dart';

class FightersStore extends StreamStore<Exception, FightersState> {
  final GetFightersUseCase _getFightersUseCase;
  final GetUniversesUseCase _getUniversesUseCase;
  FightersStore(this._getFightersUseCase, this._getUniversesUseCase) : super(FightersState.initial());

  Future<void> getFighters() async {
    try {
      setLoading(true);
      final fighters = await _getFightersUseCase(state.filters.universe.name);
      update(state.copyWith(fighters: fighters));
      await _filterFighters();
    } on Exception catch (ex) {
      setError(ex);
    } finally {
      setLoading(false);
    }
  }

  Future<void> getUniverses() async {
    try {
      setLoading(true);
      final universes = await _getUniversesUseCase.call();
      universes.insert(0, UniverseEntity.all());
      update(state.copyWith(universes: universes));
      await _filterFighters();
    } on Exception catch (ex) {
      setError(ex);
    } finally {
      setLoading(false);
    }
  }

  Future<void> _filterFighters() async {
    if (state.fighters == null) return;

    const thirdFilter = SortFilterService();
    const secondFilter = PriceFilterService(next: thirdFilter);
    const firstFilter = StarsFilterService(next: secondFilter);

    final filteredFighters = firstFilter.filter(state.fighters!, state.filters);
    update(state.copyWith(filteredFighters: filteredFighters));
  }

  Future<void> onFiltersChanged(FilterEntity filters) async {
    update(state.copyWith(filters: filters));
    _filterFighters();
  }

  Future<void> onUniverseChanged(UniverseEntity? universe) async {
    update(state.copyWith(filters: state.filters.copyWith(universe: universe)));
    await getFighters();
  }
}
