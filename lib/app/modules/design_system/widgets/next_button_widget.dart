import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smash_fighters/app/modules/design_system/design_system_module.dart';

class NextButtonWidget extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  const NextButtonWidget({Key? key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(27)),
        constraints: const BoxConstraints(minWidth: 192, minHeight: 54),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: DefaultTextStyle(style: FontPalette.current.nextButton, textAlign: TextAlign.center, child: child ?? Container()),
      ),
    );
  }
}
