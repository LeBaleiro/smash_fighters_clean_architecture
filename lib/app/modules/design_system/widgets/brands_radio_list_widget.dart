import 'package:flutter/material.dart';

import '../design_system_module.dart';

class BrandsRadioListWidget extends StatefulWidget {
  final List<String> items;
  final void Function(int index)? onChanged;
  final int? initialSelectedIndex;
  const BrandsRadioListWidget({Key? key, this.initialSelectedIndex, required this.items, this.onChanged}) : super(key: key);

  @override
  _BrandsRadioListWidgetState createState() => _BrandsRadioListWidgetState();
}

class _BrandsRadioListWidgetState extends State<BrandsRadioListWidget> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          widget.items.length,
          (index) {
            return BrandWidget(
              isSelected: selectedIndex == index,
              title: widget.items[index],
              onTap: () {
                setState(() => selectedIndex = index);
                widget.onChanged?.call(index);
              },
            );
          },
        ).expand((item) => [item, const SizedBox(width: 9)]).toList(),
      ),
    );
  }
}
