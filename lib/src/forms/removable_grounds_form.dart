import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RemovableGroundsForm extends StatefulWidget {
  const RemovableGroundsForm({super.key, required this.data});

  final RemovableGroundsData data;
  @override
  State<RemovableGroundsForm> createState() => _RemovableGroundsFormState();
}

class _RemovableGroundsFormState extends State<RemovableGroundsForm> {
  /// returns a list of 18 [Cell] widgets
  List<Cell> cells() {
    var cells = [];
    for (int i = 0; i < 18; i++) {
      cells.add(Cell());
    }
    return List.from(cells);
  }

  List<Cell> cells2() {
    final cells = [
      Cell(
          type: CellType.header,
          initialValue: 'Poistettavat maa-ainekset, poistettava alue ja määrä'),
      Cell(
        type: CellType.column,
        initialValue: 'Poistettava pinta-ala (m2)',
      ),
      Cell(type: CellType.column, initialValue: 'Poistosyvyys (m2)'),
      Cell(type: CellType.column, initialValue: 'Poistettava määrä (m3)'),
      Cell(
          type: CellType.column,
          initialValue: 'Poistettavan maan kokonaismäärä (tonnia)'),
      Cell(
          type: CellType.column,
          initialValue: 'Puhdas maa poistettavasta maasta (%)'),
      Cell(
          type: CellType.column,
          initialValue: 'Saastunut maa poistettavasta maasta (%)'),
      Cell(type: CellType.column, initialValue: 'Asfaltoitu alue (m2)'),
      Cell(type: CellType.column, initialValue: 'Asfaltti (tonnia)'),
      Cell(type: CellType.empty),
      Cell(
        type: CellType.input,
        initialValue: widget.data.groundSurfaceArea,
        setter: widget.data.setGroundSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.groundDepth,
        setter: widget.data.setGroundDepth,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.removableAmount,
        setter: widget.data.setRemovableAmount,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.removableGroundTons,
        setter: widget.data.setRemovableGroundTons,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.removableCleanGroundShare,
        setter: widget.data.setRemovableCleanGroundShare,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.contaminatedGroundShare,
        setter: widget.data.setContaminatedGroundShare,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.asphaltSurfaceArea,
        setter: widget.data.setAsphaltSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: widget.data.asphaltTons,
        setter: widget.data.setAsphaltTons,
      ),
    ];

    return cells;
  }

  @override
  void initState() {
    super.initState();
    print('Hello, World! t. RemovableGroundsForm2');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [
        150.px,
        120.px,
        120.px,
        120.px,
        120.px,
        120.px,
        120.px,
        120.px,
        120.px,
      ],
      rowSizes: [50.px, 50.px],
      children: cells2(),
      // children: [
      //   for (final cell in cells()) cell,
      // ],
    );
  }
}

// TODO: move this elsewhere, and possibly refactor everything lmao
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

enum CellType { header, row, column, empty, input, output }
