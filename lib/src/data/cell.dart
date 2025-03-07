import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/data/cell_type.dart';

class Cell extends StatefulWidget {
  const Cell({super.key, this.type, this.initialValue, this.setter});

  final CellType? type;
  final dynamic initialValue;
  final Function? setter;

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  late dynamic value = widget.initialValue ?? "hei";
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.type == CellType.input) {
      final text = widget.initialValue.toString().replaceFirst(',', '.');
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
              onChanged: (value) {
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
                  widget.setter!(castedValue);
                }
                print(castedValue);
              },
              controller: _controller,
              inputFormatters: [
                // TODO: needs fixing - currently replaces the whole line with
                // an empty string when disallowed characters are entered.
                // this is unwanted behavior - instead disallowed characters
                // should simply not be appended to the string
                FilteringTextInputFormatter.allow(
                  RegExp(r'^([0-9]+([,][0-9]*)?|[,][0-9]+)$'),
                )
              ],
            ),
          ),
        );

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
            child: Text(value),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return type();
  }
}
