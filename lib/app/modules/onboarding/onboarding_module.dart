import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/core/core_module.dart';

import 'domain/use_cases/save_onboarding_view_use_case.dart';
import 'domain/use_cases/verify_viewed_onboarding_use_case.dart';
import 'external/datasources/onboarding_cache_datasource.dart';
import 'infra/repositories/onboarding_repository.dart';
import 'presenter/pages/onboarding_page.dart';
import 'presenter/stores/onboarding_store.dart';

export 'external/datasources/onboarding_cache_datasource.dart';
export 'presenter/stores/onboarding_store.dart';

class OnboardingModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardingStore(i(), i()), export: true),
    Bind.lazySingleton((i) => VerifyViewedOnboardingUseCase(i()), export: true),
    Bind.lazySingleton((i) => SaveOnboardingViewUseCase(i()), export: true),
    Bind.lazySingleton((i) => OnboardingRepository(i()), export: true),
    Bind.lazySingleton((i) => OnboardingCacheDatasource(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const OnboardingPage()),
  ];
}
