import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maths/maths.dart';

/// An example widget. Use triple /// to document classes, functions
/// or variables. Hover over them to display this content, at least on
/// VSCode. Refer to other variables or classes with brackets,
/// like so: [Calculator].
class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  // text editing controllers listen to the text inside text fields
  final TextEditingController _firstField = TextEditingController();
  final TextEditingController _secondField = TextEditingController();
  int sum = 0;
  int subtraction = 0;

  /// This function returns a String.
  int calculateSum() {
    // final is a runtime const -- in this case
    // const cannot be used, because the content
    // is not available in compile time
    final x = _firstField.text.isNotEmpty ? int.parse(_firstField.text) : 0;
    // dart has ternary operator
    final y = _secondField.text.isNotEmpty ? int.parse(_secondField.text) : 0;
    return Calculator.sum(x, y);
  }

  /// This function retuns a Text widget.
  int calculateSubtraction() {
    final x = _firstField.text.isNotEmpty ? int.parse(_firstField.text) : 0;
    final y = _secondField.text.isNotEmpty ? int.parse(_secondField.text) : 0;
    return Calculator.subtraction(x, y);
  }

  void handleTextFieldChange() {
    setState(() {
      sum = calculateSum();
      subtraction = calculateSubtraction();
    });
  }

  // dispose() gets called when widget is removed from widget tree
  @override
  void dispose() {
    // controllers need to be disposed of
    _firstField.dispose();
    _secondField.dispose();
    // this is done normally, but since we override, add it manually
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('First number'),
          TextField(
            minLines: 1,
            maxLines: 1,
            controller: _firstField,
            onChanged: (value) => handleTextFieldChange(),
            // accepts only digits
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          Text('Second number'),
          TextField(
            minLines: 1,
            maxLines: 1,
            controller: _secondField,
            onChanged: (value) => handleTextFieldChange(),
            // accepts only digits
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          // displays text editing controller's content
          Text('First: ${_firstField.text}'),
          Text('Second: ${_secondField.text}'),
          Text('Sum: $sum'),
          Text('Subtraction: $subtraction'),
        ],
      ),
    );
  }
}
