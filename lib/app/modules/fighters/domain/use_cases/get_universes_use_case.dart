import '../entities/universe_entity.dart';
import '../repositories/fighters_repository_interface.dart';

class GetUniversesUseCase {
  final IFightersRepository _repository;

  GetUniversesUseCase(this._repository);

  Future<List<UniverseEntity>> call() async {
    final universes = await _repository.getUniverses();
    universes.sort((universeA, universeB) => universeA.name.toLowerCase().compareTo(universeB.name.toLowerCase()));
    return universes;
  }
}
