import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_fighters/app/modules/core/core_module.dart';
import 'package:smash_fighters/app/modules/fighters/fighters_module.dart';
import 'package:smash_fighters/app/modules/onboarding/onboarding_module.dart';

import '../../design_system/design_system_module.dart';
import 'splash_mixin.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with SplashMixin {
  final ICacheService cacheService = Modular.get();
  final FightersCacheDatasource fightersCacheDatasource = Modular.get();
  final OnboardingCacheDatasource onboardingCacheDatasource = Modular.get();
  final OnboardingStore onboardingStore = Modular.get();

  @override
  final minDuration = const Duration(seconds: 3);

  @override
  void onFinishLoading(List responses) {
    if (onboardingStore.state.onboardingAlreadyViewed) {
      Modular.to.navigate('/fighters/');
    } else {
      Modular.to.navigate('/intro/');
    }
  }

  @override
  List<Future> get futures => <Future>[
        precacheImage(const AssetImage('assets/intro/image1.png'), context),
        precacheImage(const AssetImage('assets/intro/image2.png'), context),
        precacheImage(const AssetImage('assets/intro/image3.png'), context),
        cacheService
            .initialize()
            .then((_) => Future.wait([
                  onboardingCacheDatasource.initialize(),
                  fightersCacheDatasource.initialize(),
                ]))
            .then((_) => Future.wait([
                  onboardingStore.initialize(),
                ])),
      ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFF99F00), Color(0xFFDB3069)],
                stops: [0, 0.778],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 45),
                  child: BlendMask(
                    opacity: 1.0,
                    blendMode: BlendMode.overlay,
                    child: SizedBox(child: Image.asset('assets/splash/logo.png')),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
