import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/foundation_type_and_foors_data.dart';

class OutputCell extends StatefulWidget {
  const OutputCell({
    super.key,
    required this.data,
    required this.getter,
  });

  final Function getter;

  // TODO: make this a lot more generic
  final FoundationTypeAndFloorsData data;

  @override
  State<OutputCell> createState() => _OutputCellState();
}

class _OutputCellState extends State<OutputCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFB9B9B9),
        border: Border.all(
          width: 1,
        ),
      ),
      child: Center(
        child: StreamBuilder<double>(
            stream: widget.data.onChange,
            builder: (context, snapshot) {
              return Text(
                widget.getter().toString(),
              );
            }),
      ),
    );
  }
}
