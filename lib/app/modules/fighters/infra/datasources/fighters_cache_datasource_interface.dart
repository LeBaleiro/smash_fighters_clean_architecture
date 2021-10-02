import '../../domain/entities/universe_entity.dart';

import '../../domain/entities/fighter_entity.dart';

abstract class IFightersCacheDatasource {
  Future<void> initialize();
  Future<void> saveFighters(String universeName, List<FighterEntity> fighters);
  Future<void> saveUniverses(List<UniverseEntity> universes);
  Future<List<FighterEntity>> getFighters(String universeName);
  Future<List<UniverseEntity>> getUniverses();
}
