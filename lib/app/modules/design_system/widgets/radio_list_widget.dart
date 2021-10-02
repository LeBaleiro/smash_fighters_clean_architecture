import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../design_system_module.dart';

class RadioListWidget<T extends Enum> extends StatefulWidget {
  final List<T> items;
  final int? initialSelectedIndex;
  final void Function(int index) onSelectItem;
  const RadioListWidget({
    Key? key,
    this.initialSelectedIndex,
    required this.items,
    required this.onSelectItem,
  }) : super(key: key);

  @override
  _RadioListWidgetState createState() => _RadioListWidgetState();
}

class _RadioListWidgetState extends State<RadioListWidget> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.items.length,
        (index) => Padding(
          padding: const EdgeInsets.fromLTRB(53, 0, 34, 0),
          child: RadioButtonWidget(
            title: Text(describeEnum(widget.items[index])),
            isSelected: selectedIndex == index,
            onSelected: () {
              widget.onSelectItem(index);
              setState(() => selectedIndex = index);
            },
          ),
        ),
      ),
    );
  }
}
