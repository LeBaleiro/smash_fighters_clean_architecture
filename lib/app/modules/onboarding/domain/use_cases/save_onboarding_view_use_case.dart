import '../repositories/onboarding_repository_interface.dart';

class SaveOnboardingViewUseCase {
  final IOnboardingRepository _repository;

  SaveOnboardingViewUseCase(this._repository);

  Future<void> call() async {
    return await _repository.saveOnboardingView();
  }
}
