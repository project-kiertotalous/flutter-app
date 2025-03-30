import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';

/// Meant to use in top left cell of a form.
class HeaderCell extends StatelessWidget implements Cell {
  const HeaderCell({super.key, required this.initialValue});

  final String initialValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide(width: 1))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Text(
            initialValue,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
