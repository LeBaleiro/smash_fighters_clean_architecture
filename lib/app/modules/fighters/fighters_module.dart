import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/core/core_module.dart';

import 'domain/use_cases/get_fighters_use_case.dart';
import 'domain/use_cases/get_universes_use_case.dart';
import 'external/datasources/fighters_cache_datasource.dart';
import 'external/datasources/fighters_datasource.dart';
import 'infra/repositories/fighters_repository.dart';
import 'presenter/pages/details_page.dart';
import 'presenter/pages/fighters_page.dart';
import 'presenter/pages/filters_page.dart';
import 'presenter/stores/fighters_store.dart';

export 'external/datasources/fighters_cache_datasource.dart';
export 'domain/entities/fighter_entity.dart';
export 'domain/entities/filter_entity.dart';
export 'domain/entities/universe_entity.dart';

class FightersModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FightersStore(i(), i())),
    Bind.lazySingleton((i) => GetFightersUseCase(i())),
    Bind.lazySingleton((i) => GetUniversesUseCase(i())),
    Bind.lazySingleton((i) => FightersRepository(i(), i(), i())),
    Bind.lazySingleton((i) => FightersDatasource(i())),
    Bind.lazySingleton((i) => FightersCacheDatasource(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const FightersPage()),
    ChildRoute('/filters', child: (_, args) => const FiltersPage()),
    ChildRoute('/details', child: (_, args) => DetailsPage(fighterModel: args.data)),
  ];
}
