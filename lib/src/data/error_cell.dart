import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';

class ErrorCell extends StatelessWidget implements Cell {
  const ErrorCell({
    super.key,
    required this.getters,
  });

  final List<Function> getters; // List of getter functions

  @override
  Widget build(BuildContext context) {
    // Check if any percentage is not exactly 100%
    bool hasError = getters.any((getter) => getter() != 100.0);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: hasError ? Colors.red.shade100 : Colors.green.shade100,
        border: Border.all(
          width: 1,
          color: hasError ? Colors.red : Colors.green,
        ),
      ),
      child: Center(
        child: hasError
            ? Text(
                "Virhe! Yhden tai useamman yhdistetty prosenttimäärä ei ole 100% !",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            : Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
      ),
    );
  }
}
