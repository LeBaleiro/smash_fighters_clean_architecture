import 'package:flutter/material.dart';

import '../design_system_module.dart';

class SimpleAppbarWidget extends StatelessWidget {
  final Widget title;
  final Widget? action;
  final Widget? leading;
  const SimpleAppbarWidget({Key? key, required this.title, this.action, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: FontPalette.current.appbarTitle,
              child: Padding(padding: const EdgeInsets.all(18), child: title),
            ),
            if (leading != null) Positioned(left: 0, bottom: 0, top: 0, child: leading!),
            if (action != null) Positioned(right: 20, bottom: 0, top: 0, child: action!),
          ],
        ),
      ),
    );
  }
}
