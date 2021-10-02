import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const RoundedButtonWidget({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 11),
        constraints: const BoxConstraints(minWidth: 125, minHeight: 39),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, color: Colors.white, letterSpacing: -0.5, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
