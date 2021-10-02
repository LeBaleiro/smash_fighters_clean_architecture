import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:smash_fighters/app/modules/onboarding/domain/use_cases/save_onboarding_view_use_case.dart';
import 'package:smash_fighters/app/modules/onboarding/domain/use_cases/verify_viewed_onboarding_use_case.dart';

import '../models/onboarding_page_model.dart';
import '../states/onboarding_state.dart';

export '../states/onboarding_state.dart';

class OnboardingStore extends NotifierStore<Exception, OnboardingState> {
  final SaveOnboardingViewUseCase saveOnboardingViewUseCase;
  final VerifyViewedOnboardingUseCase verifyViewedOnboardingUseCase;
  OnboardingStore(
    this.saveOnboardingViewUseCase,
    this.verifyViewedOnboardingUseCase,
  ) : super(const OnboardingState.start());

  static final initialPages = [
    OnboardingPageModel(
      text: 'Access our\nExtented Catalog',
      image: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Image.asset('assets/intro/image1.png', alignment: Alignment.topCenter),
      ),
    ),
    OnboardingPageModel(
      text: 'Filter Universes',
      image: Padding(
        padding: const EdgeInsets.only(top: 40.45),
        child: Image.asset('assets/intro/image2.png', alignment: Alignment.topCenter),
      ),
    ),
    OnboardingPageModel(
      text: 'And More...',
      image: Padding(
        padding: const EdgeInsets.only(top: 59),
        child: Image.asset('assets/intro/image3.png', alignment: Alignment.topCenter),
      ),
    ),
  ];

  Future<void> initialize() async {
    final onboardingAlreadyViewed = await verifyViewedOnboardingUseCase();
    update(state.copyWith(onboardingAlreadyViewed: onboardingAlreadyViewed));
  }

  @override
  void initStore() {
    update(state.copyWith(pages: initialPages));
    super.initStore();
  }

  void onNextButtonPressed() {
    update(state.copyWith(currentPageIndex: state.currentPageIndex + 1));
  }

  void onGetStartedButtonPressed() {
    saveOnboardingViewUseCase();
    Modular.to.navigate('/fighters/');
  }
}
