import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/core/core_module.dart';
import 'package:smash_fighters/app/modules/fighters/fighters_module.dart';

import 'presenter/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), FightersModule()];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
