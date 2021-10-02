import 'package:smash_fighters/app/modules/core/core_module.dart';
import 'package:smash_fighters/app/modules/onboarding/infra/datasources/onboarding_cache_datasource_interface.dart';

class OnboardingCacheDatasource implements IOnboardingCacheDatasource {
  final ICacheService _cacheService;

  OnboardingCacheDatasource(this._cacheService);

  @override
  Future<void> initialize() async {
    await _cacheService.registerUninitializedBox('onboarding');
  }

  @override
  Future<void> saveOnboardingView() async {
    await _cacheService.saveEntry('onboarding', 'view', {'alreadyViewd': true});
  }

  @override
  Future<bool> verifyViewedOnboarding() async {
    final viewed = _cacheService.getEntry('onboarding', 'view');
    if (viewed == null || viewed['alreadyViewd'] == null || viewed['alreadyViewd'] == false) {
      return false;
    } else {
      return true;
    }
  }
}
