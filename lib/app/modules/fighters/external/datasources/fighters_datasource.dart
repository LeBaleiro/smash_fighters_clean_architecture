import 'package:smash_fighters/app/modules/core/core_module.dart';

import '../../domain/entities/fighter_entity.dart';
import '../../domain/entities/universe_entity.dart';
import '../../infra/datasources/fighters_datasource_interface.dart';
import '../mappers/fighter_mapper.dart';
import '../mappers/universe_mapper.dart';

class FightersDatasource implements IFightersDatasource {
  final ICustomClientService _client;
  FightersDatasource(this._client);

  @override
  Future<List<FighterEntity>> getFighters(String universeName) async {
    final response = await _client.get(
      '/fighters',
      queryParameters: {
        if (universeName.toLowerCase() != 'all') 'universe': universeName,
      },
    );
    final fighters = FighterMapper.fromMapList(response.data);
    return fighters;
  }

  @override
  Future<List<UniverseEntity>> getUniverses() async {
    final response = await _client.get('/universes');
    final universes = UniverseMapper.fromMapList(response.data);
    return universes;
  }
}
