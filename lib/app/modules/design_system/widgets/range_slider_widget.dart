import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final RangeValues? initialValue;
  final void Function(RangeValues value) onChanged;
  const RangeSliderWidget({
    Key? key,
    required this.maxValue,
    required this.onChanged,
    required this.minValue,
    required this.initialValue,
  }) : super(key: key);

  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  late RangeValues selectedValue;
  String get startValue => '\$${selectedValue.start.toStringAsFixed(2).replaceAll('.', ',')}';
  String get endValue => '\$${selectedValue.end.toStringAsFixed(2).replaceAll('.', ',')}';

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? RangeValues(widget.minValue, widget.maxValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(startValue),
              Text(endValue),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 38, right: 20),
          child: RangeSlider(
            values: selectedValue,
            min: widget.minValue,
            max: widget.maxValue,
            activeColor: const Color(0xFF64C328),
            inactiveColor: const Color(0xFFB6B6B6),
            onChanged: (value) {
              setState(() => selectedValue = value);
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
