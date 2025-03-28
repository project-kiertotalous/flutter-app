import 'package:flutter/material.dart';

class OutputCell extends StatelessWidget {
  const OutputCell({
    super.key,
    required this.getter,
    this.percentage = false,
  });

  final Function getter;
  final bool percentage; // Used for Percentage display instead of value

  @override
  Widget build(BuildContext context) {
    var value = getter();
    String displayValue;

    if (percentage && value is num) {
      displayValue =
          "${(value * 100).toInt()}%"; // Convert to integer percentage
    } else {
      displayValue = value?.toString() ?? "0.0";
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFB9B9B9),
        border: Border.all(
          width: 1,
        ),
      ),
      child: Center(
        child: Text(displayValue),
      ),
    );
  }
}
