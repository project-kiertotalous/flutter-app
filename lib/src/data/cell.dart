import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/info_button.dart';

class Cell extends StatefulWidget {
  const Cell({
    super.key,
    this.type,
    this.initialValue,
    this.setter,
    this.iconButton,
    this.checkbox = false,
    this.checkboxTitle,
    this.checkboxSetter,
    this.checkboxValue,
    this.percentage = false, // New property for percentage handling
  }) : assert(!checkbox ||
            checkbox &&
                checkboxTitle != null &&
                checkboxSetter != null &&
                checkboxValue != null &&
                type == CellType.row);

  final CellType? type;
  final dynamic initialValue;
  final Function? setter;
  final InfoButton? iconButton;
  final bool checkbox;
  final String? checkboxTitle;
  final Function? checkboxSetter;
  final bool? checkboxValue;
  final bool
      percentage; // Determines if the input should be treated as a percentage

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  late dynamic value = widget.initialValue;
  TextEditingController? _controller;

  // Convert value to a percentage string (e.g., 0.2 -> 20%)
  String formatValueForDisplay(dynamic value) {
    if (widget.percentage && value is num) {
      return "${(value * 100).toInt()}%"; // Convert to integer percentage for display
    } else {
      return value?.toString() ?? "0.0";
    }
  }

  // Convert the input to a decimal value for storage (e.g., 20% -> 0.2)
  void handleChange(String value) {
    print('Controller value: ${_controller?.text}');
    var formattedValue = '0';

    if (value.isNotEmpty) {
      formattedValue = value.replaceFirst(RegExp(','), '.');

      if (formattedValue.endsWith('.')) {
        formattedValue = '${formattedValue}0';
      }

      // If percentage is enabled and value doesn't already contain a %, assume it's a percentage
      if (widget.percentage) {
        // Remove the percentage symbol and convert to decimal
        formattedValue = formattedValue.replaceAll('%', '').trim();
        double? parsedValue = double.tryParse(formattedValue);
        if (parsedValue != null) {
          formattedValue = (parsedValue / 100).toString(); // Convert 10 to 0.1
        }
      }
    }

    double castedValue = double.tryParse(formattedValue) ?? 0.0;
    if (widget.setter != null) {
      widget.setter!(castedValue);
    }
    print(castedValue);
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == CellType.input) {
      // Initialize the controller with the formatted initial value for percentage display
      final text = formatValueForDisplay(widget.initialValue ?? 0.0);
      _controller = TextEditingController(text: text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  // Returns a widget depending on the type of the cell
  Widget type() {
    switch (widget.type) {
      case CellType.input:
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Center(
            child: TextField(
              onChanged: (value) => handleChange(value),
              controller: _controller,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(widget.percentage
                      ? r'([0-9]+([,][0-9]*)?[%]?)' // Allow numbers with optional % (e.g., "10%")
                      : r'([0-9]+([,][0-9]*)?|[,][0-9]+)'), // Regular decimal numbers
                ),
              ],
            ),
          ),
        );
      case CellType.row:
      default:
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.initialValue?.toString() ?? ""),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return type();
  }
}
