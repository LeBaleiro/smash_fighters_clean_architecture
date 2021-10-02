import '../../domain/entities/fighter_entity.dart';
import '../../domain/entities/universe_entity.dart';

abstract class IFightersDatasource {
  Future<List<FighterEntity>> getFighters(String universeName);
  Future<List<UniverseEntity>> getUniverses();
}
