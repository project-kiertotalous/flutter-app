import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/data/cell_type.dart';

// TODO: eventually content of this class should be eliminated and different types moved to their own files
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
  }) : assert(!checkbox ||
            checkbox &&
                checkboxTitle != null &&
                checkboxSetter != null &&
                checkboxValue != null &&
                type == CellType.row);

  final CellType? type;
  final dynamic initialValue;
  final Function? setter;
  final IconButton? iconButton;
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

  Widget cellContent() {
    // if more content than text
    if (widget.checkbox || widget.iconButton != null) {
      List<Widget> list = [];
      list.add(Text(widget.initialValue));
      if (widget.checkbox) {
        list.add(
          Checkbox(
            value: widget.checkboxValue,
            onChanged: (value) => widget.checkboxSetter!(value),
          ),
        );
        list.add(Text(widget.checkboxTitle!));
      }
      if (widget.iconButton != null) {
        list.add(widget.iconButton!);
      }
      return Row(
        children: list,
      );
    }
    // if only text
    return Align(
        alignment: Alignment.centerLeft, child: Text(widget.initialValue));
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == CellType.input) {
      final text = periodToComma(widget.initialValue ?? 0.0 );
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
            child: Text(value?.toString() ?? "0.0"),
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
            child: Text(value?.toString() ?? "0.0"),
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
          child: cellContent(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return type();
  }
}
