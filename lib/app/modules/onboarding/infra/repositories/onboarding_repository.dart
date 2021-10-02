import 'package:smash_fighters/app/modules/onboarding/domain/repositories/onboarding_repository_interface.dart';
import 'package:smash_fighters/app/modules/onboarding/infra/datasources/onboarding_cache_datasource_interface.dart';

class OnboardingRepository implements IOnboardingRepository {
  final IOnboardingCacheDatasource _datasource;

  OnboardingRepository(this._datasource);

  @override
  Future<void> saveOnboardingView() async {
    await _datasource.saveOnboardingView();
  }

  @override
  Future<bool> verifyViewedOnboarding() async {
    return await _datasource.verifyViewedOnboarding();
  }
}
