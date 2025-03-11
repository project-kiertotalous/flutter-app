import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';

class MenuCell extends StatefulWidget {
  const MenuCell({
    super.key,
    required this.setter,
    required this.initialValue,
    required this.items,
  });

  final List<DropdownMenuItem<dynamic>> items;
  final Function setter;
  final FoundationMaterial? initialValue;

  @override
  State<MenuCell> createState() => _MenuCellState();
}

class _MenuCellState extends State<MenuCell> {
  late FoundationMaterial? currentValue = widget.initialValue;

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
        items: widget.items,
        onChanged: (value) {
          widget.setter(value);
          setState(() => currentValue = value);
        },
      ),
    );
  }
}
