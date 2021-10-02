import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/onboarding/onboarding_module.dart';

import 'modules/core/core_module.dart';
import 'modules/fighters/fighters_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), OnboardingModule()];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/intro', module: OnboardingModule()),
    ModuleRoute('/fighters', module: FightersModule()),
  ];
}
