import 'package:flutter/material.dart';

class OutputCell extends StatelessWidget {
  const OutputCell({
    super.key,
    required this.getter,
  });

  final Function getter;

  @override
  Widget build(BuildContext context) {
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
        child: Text(
          getter()?.toString() ?? "0.0"
        ),
      ),
    );
  }
}
