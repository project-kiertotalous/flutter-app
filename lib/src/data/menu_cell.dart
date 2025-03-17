import 'package:flutter/material.dart';

class MenuCell<T> extends StatefulWidget {
  const MenuCell({
    super.key,
    required this.setter,
    required this.initialValue,
    required this.items,
  });

  final List<DropdownMenuItem<T?>> items;
  final Function(T?) setter;
  final T? initialValue;

  @override
  State<MenuCell<T>> createState() => _MenuCellState<T>();
}

class _MenuCellState<T> extends State<MenuCell<T>> {
  late T? currentValue = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        border: Border.all(width: 1),
      ),
      child: DropdownButton<T?>(
        value: currentValue,
        items: widget.items,
        onChanged: (T? value) {
          widget.setter(value);
          setState(() => currentValue = value);
        },
      ),
    );
  }
}
