import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RemovableGroundsForm extends StatefulWidget {
  const RemovableGroundsForm({super.key, required this.data});

  final RemovableGroundsData data;
  @override
  State<RemovableGroundsForm> createState() => _RemovableGroundsFormState();
}

class _RemovableGroundsFormState extends State<RemovableGroundsForm> {
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
