import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:smash_fighters/app/modules/design_system/design_system_module.dart';
import 'package:smash_fighters/app/modules/design_system/theme/font_palette.dart';

import '../stores/onboarding_store.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageController = PageController();
  final OnboardingStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.observer(onState: (state) {
      if (state.currentPageIndex != pageController.page?.toInt()) {
        pageController.animateToPage(
          state.currentPageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE55249), Color(0xFF2A52BE)],
            stops: [0, 0.8289],
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: store.state.pages.length,
              itemBuilder: (context, index) => store.state.pages[index].image,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 3 * 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.4464],
                    colors: [
                      const Color(0xFF222222).withOpacity(0.01),
                      const Color(0xFF222222),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF345CC5).withOpacity(0.01),
                    const Color(0xFF142246),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ScopedBuilder<OnboardingStore, Exception, OnboardingState>(
                    store: store,
                    onState: (context, state) {
                      return Text(
                        store.state.currentPage.text,
                        textAlign: TextAlign.center,
                        style: FontPalette.current.introTitle,
                      );
                    },
                  ),
                  const SizedBox(height: 69),
                  ScopedBuilder<OnboardingStore, Exception, OnboardingState>(
                    store: store,
                    onState: (context, state) {
                      return NextButtonWidget(
                        child: Text(state.isLastestPage ? 'Get Started' : 'Next'),
                        onPressed: state.isLastestPage ? store.onGetStartedButtonPressed : store.onNextButtonPressed,
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
