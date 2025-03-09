import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/foundation_type_and_foors_data.dart';

class MenuCell extends StatefulWidget {
  const MenuCell({
    super.key,
    required this.setter,
    required this.initialValue,
  });

  final Function setter;
  final Enum initialValue;

  @override
  State<MenuCell> createState() => _MenuCellState();
}

class _MenuCellState extends State<MenuCell> {
  late Enum currentValue = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEAEAEA),
        border: Border.all(
          width: 1,
        ),
      ),
      child: DropdownButton(
        value: currentValue,
        items: FoundationAndFloorType.toList(),
        onChanged: (value) {
          widget.setter(value);
          setState(() => currentValue = value);
        },
      ),
    );
  }
}
