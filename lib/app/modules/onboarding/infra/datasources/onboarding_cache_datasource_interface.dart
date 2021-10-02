abstract class IOnboardingCacheDatasource {
  Future<void> initialize();
  Future<void> saveOnboardingView();
  Future<bool> verifyViewedOnboarding();
}
