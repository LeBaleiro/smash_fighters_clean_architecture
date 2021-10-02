import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  final bool isSelected;
  final String? title;
  final VoidCallback? onTap;
  const BrandWidget({Key? key, this.isSelected = false, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        constraints: const BoxConstraints(minWidth: 123, minHeight: 37),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        ),
        child: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
