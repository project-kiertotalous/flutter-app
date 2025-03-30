import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';

class ColumnCell extends StatelessWidget implements Cell {
  const ColumnCell({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide(width: 1))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          initialValue,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
