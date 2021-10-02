import 'package:smash_fighters/app/modules/core/core_module.dart';
import 'package:smash_fighters/app/modules/fighters/infra/datasources/fighters_cache_datasource_interface.dart';

import '../../domain/entities/fighter_entity.dart';
import '../../domain/entities/universe_entity.dart';
import '../../domain/repositories/fighters_repository_interface.dart';
import '../datasources/fighters_datasource_interface.dart';

class FightersRepository implements IFightersRepository {
  final IFightersDatasource _datasource;
  final IFightersCacheDatasource _cacheDatasource;
  final INetworkInfoService _networkInfoService;

  FightersRepository(
    this._datasource,
    this._cacheDatasource,
    this._networkInfoService,
  );
  @override
  Future<List<FighterEntity>> getFighters(String universeName) async {
    if (await _networkInfoService.isConnected) {
      final response = await _datasource.getFighters(universeName);
      await _cacheDatasource.saveFighters(universeName, response);
      return response;
    } else {
      final cachedList = _cacheDatasource.getFighters(universeName);
      return cachedList;
    }
  }

  @override
  Future<List<UniverseEntity>> getUniverses() async {
    if (await _networkInfoService.isConnected) {
      final response = await _datasource.getUniverses();
      await _cacheDatasource.saveUniverses(response);
      return response;
    } else {
      final cachedList = _cacheDatasource.getUniverses();
      return cachedList;
    }
  }
}
