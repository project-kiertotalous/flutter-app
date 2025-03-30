import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/data/cell.dart';

class InputCell extends StatefulWidget implements Cell {
  const InputCell({
    super.key,
    required this.initialValue,
    required this.setter,
    this.integer = false,
    this.percentage = false,
  });

  final num? initialValue;
  final Function setter;
  final bool integer;
  final bool percentage;

  @override
  State<InputCell> createState() => _InputCellState();
}

class _InputCellState extends State<InputCell> {
  late TextEditingController _controller;

  void setIntValue(String value) {
    widget.setter(int.parse(value));
  }

  void setDoubleValue(String value) {
    logger.d('Controller value: ${_controller?.text}');
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
    num castedValue = double.parse(formattedValue);
    // set new value to form
    widget.setter(castedValue);
    logger.d(castedValue);
  }

  List<TextInputFormatter> formatters() {
    if (widget.integer) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return [
      FilteringTextInputFormatter.allow(RegExp(widget.percentage
          ? r'([0-9]+([,][0-9]*)?)'
          : r'([0-9]+([,][0-9]*)?|[,][0-9]+)')),
    ];
  }

  String formatDisplayedValue() {
    if (widget.initialValue == null || widget.initialValue == 0) {
      return widget.percentage ? '0%' : '0';
    }
    if (widget.percentage) {
      return '${(widget.initialValue! * 100).toStringAsFixed(0)}%';
    }
    return widget.initialValue!.toString().replaceFirst('.', ',');
  }

  void _setTextSafely(String newText) {
    final cursorPosition = _controller.selection.baseOffset;
    _controller.text = newText;
    _controller.selection = TextSelection.collapsed(
      offset: newText.length < cursorPosition ? newText.length : cursorPosition,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: formatDisplayedValue());
  }

  @override
  void didUpdateWidget(covariant InputCell oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue) {
      _setTextSafely(formatDisplayedValue());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) =>
              widget.integer ? setIntValue(value) : setDoubleValue(value),
          controller: _controller,
          inputFormatters: formatters(),
        ),
      ),
    );
  }
}
