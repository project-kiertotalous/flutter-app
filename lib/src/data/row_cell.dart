import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';

class RowCell extends StatelessWidget implements Cell {
  const RowCell({
    super.key,
    this.initialValue,
    this.checkbox = false,
    this.checkboxTitle,
    this.checkboxSetter,
    this.checkboxValue,
    this.iconButton, // Change type to Widget?
  });

  final dynamic initialValue;
  final bool checkbox;
  final String? checkboxTitle;
  final Function? checkboxSetter;
  final bool? checkboxValue;
  final Widget? iconButton; // Changed from IconButton? to Widget?

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Expands to fill available width
      height: double.infinity, // Expands to fill available height
      decoration: BoxDecoration(border: Border.all(width: 1)), // Main border
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Ensures full height is used
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(initialValue?.toString() ?? ""),
              ),
            ),
            if (iconButton != null) iconButton!,
            if (checkbox)
              // Wrap the checkbox container in IntrinsicHeight to make it match the row's height
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEAEA),
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Prevent the Row from expanding
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center vertically
                    children: [
                      if (checkboxTitle != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(checkboxTitle!),
                        ),
                      Checkbox(
                        value: checkboxValue ?? false,
                        onChanged: (bool? newValue) {
                          checkboxSetter?.call(newValue);
                        },
                        checkColor: Colors.white, // Checkmark color
                        activeColor: Colors.green, // Color when checked
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
