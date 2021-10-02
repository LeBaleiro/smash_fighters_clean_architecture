import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFDB3069),
        colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xFFDB3069)),
        scaffoldBackgroundColor: Colors.white,
      ),
    ).modular();
  }
}
