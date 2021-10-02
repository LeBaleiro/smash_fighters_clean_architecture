import '../models/onboarding_page_model.dart';

class OnboardingState {
  final int currentPageIndex;
  final List<OnboardingPageModel> pages;
  final bool onboardingAlreadyViewed;

  OnboardingPageModel get currentPage => pages[currentPageIndex];
  bool get isLastestPage => currentPageIndex == pages.length - 1;

  const OnboardingState({
    required this.currentPageIndex,
    required this.pages,
    required this.onboardingAlreadyViewed,
  });
  const OnboardingState.start()
      : currentPageIndex = 0,
        pages = const [],
        onboardingAlreadyViewed = false;

  OnboardingState copyWith({
    int? currentPageIndex,
    List<OnboardingPageModel>? pages,
    bool? onboardingAlreadyViewed,
  }) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pages: pages ?? this.pages,
      onboardingAlreadyViewed: onboardingAlreadyViewed ?? this.onboardingAlreadyViewed,
    );
  }
}
