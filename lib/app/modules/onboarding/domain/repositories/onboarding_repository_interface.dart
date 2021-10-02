abstract class IOnboardingRepository {
  Future<void> saveOnboardingView();
  Future<bool> verifyViewedOnboarding();
}
