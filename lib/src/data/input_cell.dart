import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/log.dart';

class InputCell extends StatefulWidget {
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

  String periodToComma(String text) {
    return text.replaceFirst('.', ',');
  }

  void setValue(String value) {
    logger.d('Controller value: ${_controller.text}');

    var formattedValue =
        value.replaceFirst(RegExp(','), '.').replaceAll('%', '').trim();

    if (formattedValue.isEmpty) {
      widget.setter(0);
      return;
    }

    if (formattedValue.endsWith('.')) {
      formattedValue = '${formattedValue}0';
    }

    num? parsedValue = widget.integer
        ? int.tryParse(formattedValue)
        : double.tryParse(formattedValue);

    if (parsedValue != null) {
      if (widget.percentage) {
        parsedValue /= 100;
      }
      widget.setter(parsedValue);
      logger.d(parsedValue);
    }
  }

  List<TextInputFormatter> formatters() {
    if (widget.integer) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return [
      FilteringTextInputFormatter.allow(RegExp(widget.percentage
          ? r'([0-9]+([,][0-9]*)?[%]?)'
          : r'([0-9]+([,][0-9]*)?|[,][0-9]+)')),
    ];
  }

  @override
  void initState() {
    super.initState();
    String text = widget.initialValue != null
        ? periodToComma(widget.initialValue.toString())
        : '0';
    _controller = TextEditingController(text: text);
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
          onChanged: setValue,
          controller: _controller,
          inputFormatters: formatters(),
        ),
      ),
    );
  }
}
