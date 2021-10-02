import '../repositories/onboarding_repository_interface.dart';

class VerifyViewedOnboardingUseCase {
  final IOnboardingRepository _repository;

  VerifyViewedOnboardingUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.verifyViewedOnboarding();
  }
}
