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
  /// By default the values are doubles.
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

  List<FilteringTextInputFormatter> formatters() {
    if (widget.integer) {
      return List.from([FilteringTextInputFormatter.digitsOnly]);
    }
    return List.from(
      [
        FilteringTextInputFormatter.allow(
          RegExp(r'([0-9]+([,][0-9]*)?|[,][0-9]+)'),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    final text = periodToComma(widget.initialValue);
    _controller = TextEditingController(
      text: text,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) =>
              widget.integer ? setIntValue(value) : setDoubleValue(value),
          controller: _controller,
          inputFormatters: formatters(),
        ),
      ),
    );
  }
}
