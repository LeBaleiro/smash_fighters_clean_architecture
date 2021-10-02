import '../entities/fighter_entity.dart';
import '../entities/universe_entity.dart';

abstract class IFightersRepository {
  Future<List<FighterEntity>> getFighters(String universeName);
  Future<List<UniverseEntity>> getUniverses();
}
