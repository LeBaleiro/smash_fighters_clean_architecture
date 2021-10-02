import 'package:smash_fighters/app/modules/fighters/domain/repositories/fighters_repository_interface.dart';

import '../entities/fighter_entity.dart';

class GetFightersUseCase {
  final IFightersRepository _repository;

  GetFightersUseCase(this._repository);

  Future<List<FighterEntity>> call(String universeName) async {
    return await _repository.getFighters(universeName);
  }
}
