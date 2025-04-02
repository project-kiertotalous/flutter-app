import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';

class ErrorCell extends StatelessWidget implements Cell {
  const ErrorCell({
    super.key,
    required this.getters,
  });

  final List<num?> Function() getters; // Function returning a List<num?>

  @override
  Widget build(BuildContext context) {
    // Get all values from the function
    List<num?> values = getters();

    // Find errors (percentage total is not = 100%)
    int under100Count =
        values.where((value) => value != null && value < 100.0).length;
    int over100Count =
        values.where((value) => value != null && value > 100.0).length;

    bool hasUnderError = under100Count > 0;
    bool hasOverError = over100Count > 0;
    bool hasError = hasUnderError || hasOverError;

    // If no errors, return an invisible widget
    if (!hasError) {
      return SizedBox.shrink(); // Makes the widget disappear
    }

    // Error messages
    String errorMessage = "";

    //If there are under and over errors
    if (hasUnderError && hasOverError) {
      errorMessage = (under100Count == 1 && over100Count == 1)
          ? "Virhe! Yksi prosenttien summa on alle 100% ja yksi prosenttien summa on yli 100%!"
          : "Virhe! $under100Count prosenttien summista on alle 100% ja $over100Count prosenttien summista yli 100%!";
//If there are only under errors
    } else if (hasUnderError) {
      errorMessage = under100Count == 1
          ? "Virhe! Prosentin summa on alle 100%!"
          : "Virhe! $under100Count prosenttien summista on alle 100%!";
      //If there are only over errors
    } else if (hasOverError) {
      errorMessage = over100Count == 1
          ? "Virhe! Prosentin summa on yli 100%!"
          : "Virhe! $over100Count prosenttien summista on yli 100%!";
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
