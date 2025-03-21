import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/log.dart';

class InputCell extends StatefulWidget {
  const InputCell({
    super.key,
    required this.initialValue,
    required this.setter,
    this.integer = false,
  });

  final num? initialValue;
  final Function setter;

  /// Set this as true if you want the input field to only accept and set integer values.
  /// By default, the values are doubles.
  final bool integer;

  @override
  State<InputCell> createState() => _InputCellState();
}

class _InputCellState extends State<InputCell> {
  late num? value = widget.initialValue;
  TextEditingController? _controller;

  String periodToComma(dynamic text) {
    return text.toString().replaceFirst('.', ',');
  }

  void setIntValue(String value) {
    widget.setter(value.isEmpty ? 0 : int.parse(value)); // Default to 0 if empty
  }

  void setDoubleValue(String value) {
    logger.d('Controller value: ${_controller?.text}');
    var formattedValue = value.replaceFirst(RegExp(','), '.');

    if (formattedValue.isEmpty) {
      widget.setter(0); // Default to 0 if empty
      return;
    }

    if (formattedValue.endsWith('.')) {
      formattedValue = '${formattedValue}0';
    }

    num castedValue = double.parse(formattedValue);
    widget.setter(castedValue);
    logger.d(castedValue);
  }

  List<TextInputFormatter> formatters() {
    if (widget.integer) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return [
      FilteringTextInputFormatter.allow(
        RegExp(r'([0-9]+([,][0-9]*)?|[,][0-9]+)'),
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    final text = widget.initialValue != null ? periodToComma(widget.initialValue) : '0';
    _controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) => widget.integer ? setIntValue(value) : setDoubleValue(value),
          controller: _controller,
          inputFormatters: formatters(),
        ),
      ),
    );
  }
}
