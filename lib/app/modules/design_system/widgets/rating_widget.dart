import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingWidget extends StatefulWidget {
  final int maxStarsLength;
  final int? initialSelectedValue;
  final void Function(int? value)? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double starSize;
  final double spaceBetween;
  const RatingWidget({
    Key? key,
    this.maxStarsLength = 5,
    this.initialSelectedValue,
    required this.onChanged,
    this.activeColor = const Color(0xFFFFCD00),
    this.inactiveColor = const Color(0xFFB6B6B6),
    this.starSize = 30,
    this.spaceBetween = 20,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int? selectedCount;

  @override
  void initState() {
    super.initState();
    selectedCount = widget.initialSelectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.maxStarsLength,
        (index) {
          final isSelected = index < (selectedCount ?? 0);
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (widget.onChanged != null) {
                final isLastestSelected = index == (selectedCount ?? 0) - 1;
                setState(() => selectedCount = isLastestSelected ? null : index + 1);
                widget.onChanged?.call(selectedCount);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(widget.spaceBetween / 2),
              child: SvgPicture.asset(
                'assets/icons/star.svg',
                color: isSelected ? widget.activeColor : widget.inactiveColor,
                width: widget.starSize,
              ),
            ),
          );
        },
      ),
    );
  }
}
