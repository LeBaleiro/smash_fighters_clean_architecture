import 'package:smash_fighters/app/modules/core/core_module.dart';

import '../../domain/entities/fighter_entity.dart';
import '../../domain/entities/universe_entity.dart';
import '../../infra/datasources/fighters_cache_datasource_interface.dart';
import '../mappers/fighter_mapper.dart';
import '../mappers/universe_mapper.dart';

class FightersCacheDatasource implements IFightersCacheDatasource {
  final ICacheService _cacheService;

  FightersCacheDatasource(this._cacheService);

  @override
  Future<void> initialize() async {
    await _cacheService.registerUninitializedBox('universes');
  }

  @override
  Future<List<FighterEntity>> getFighters(String universeName) async {
    await _cacheService.registerUninitializedBox(universeName);

    final cachedList = _cacheService.getAllEntries(universeName);
    return FighterMapper.fromMapList(cachedList);
  }

  @override
  Future<void> saveFighters(String universeName, List<FighterEntity> fighters) async {
    await _cacheService.registerUninitializedBox(universeName);
    final entries = fighters.map((fighter) => MapEntry(fighter.hashCode, FighterMapper.toMap(fighter)));
    final mappedList = Map.fromEntries(entries);
    await _cacheService.deleteAllEntries(universeName);
    await _cacheService.saveAllEntries(universeName, mappedList);
  }

  @override
  Future<List<UniverseEntity>> getUniverses() async {
    final cachedList = _cacheService.getAllEntries('universes');
    return UniverseMapper.fromMapList(cachedList);
  }

  @override
  Future<void> saveUniverses(List<UniverseEntity> universes) async {
    final mappedList = Map.fromEntries(universes.map((universe) => MapEntry(universe.hashCode, UniverseMapper.toMap(universe))));
    await _cacheService.deleteAllEntries('universes');
    await _cacheService.saveAllEntries('universes', mappedList);
  }
}
