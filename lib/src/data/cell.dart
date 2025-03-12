import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/data/cell_type.dart';

class Cell extends StatefulWidget {
  const Cell({
    super.key,
    this.type,
    this.initialValue,
    this.setter,
    this.checkbox = false,
    this.checkboxTitle,
    this.checkboxSetter,
    this.checkboxValue,
  }) : assert(!checkbox ||
            checkbox &&
                checkboxTitle != null &&
                checkboxSetter != null &&
                checkboxValue != null &&
                type == CellType.row);

  final CellType? type;
  final dynamic initialValue;
  final Function? setter;
  final bool checkbox;
  final String? checkboxTitle;
  final Function? checkboxSetter;
  final bool? checkboxValue;

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  late dynamic value = widget.initialValue;
  TextEditingController? _controller;

  String periodToComma(dynamic text) {
    return text.toString().replaceFirst('.', ',');
  }

  void handleChange(String value) {
    print('Controller value: ${_controller?.text}');
    var formattedValue = '0';
    // replace comma with period
    if (value.isNotEmpty) {
      formattedValue = value.replaceFirst(RegExp(','), '.');
      // add a trailing zero if it is missing
      if (formattedValue[formattedValue.length - 1] == '.') {
        formattedValue = '${formattedValue}0';
      }
    }
    // cast to double
    var castedValue = double.parse(formattedValue);
    if (widget.setter != null) {
      // set new value to form
      widget.setter!(castedValue);
    }
    print(castedValue);
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == CellType.input) {
      final text = periodToComma(widget.initialValue);
      _controller = TextEditingController(
        text: text,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  Widget type() {
    switch (widget.type) {
      case CellType.header:
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
              ),
            ),
          ),
          child: Center(
            child: Text(value),
          ),
        );
      case CellType.column:
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEAEAEA),
            border: Border.all(
              width: 1.0,
            ),
          ),
          child: Center(
            child: Text(value),
          ),
        );
      case CellType.empty:
        return Container();

      case CellType.input:
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            // borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: TextField(
              onChanged: (value) => handleChange(value),
              controller: _controller,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'([0-9]+([,][0-9]*)?|[,][0-9]+)'),
                )
              ],
            ),
          ),
        );
      case CellType.row:
      default:
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            // borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: widget.checkbox
                ? Row(
                    children: [
                      Text(value),
                      Checkbox(
                        value: widget.checkboxValue,
                        onChanged: (value) => widget.checkboxSetter!(value),
                      ),
                      Text(widget.checkboxTitle!)
                    ],
                  )
                : Text(value),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return type();
  }
}
