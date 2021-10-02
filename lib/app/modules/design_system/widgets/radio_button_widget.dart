import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final Widget title;
  final bool isSelected;
  final VoidCallback onSelected;
  const RadioButtonWidget({Key? key, required this.title, this.isSelected = false, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isSelected ? null : onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11.5),
        child: Row(
          children: [
            Expanded(child: title),
            Container(
              width: 16.64,
              height: 16.64,
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: isSelected ? const Color(0xFF64C328) : const Color(0xFFA4AAB3)),
              ),
              child: CircleAvatar(backgroundColor: isSelected ? Colors.green : Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
