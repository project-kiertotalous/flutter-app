import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/removable_grounds_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RemovableGroundsForm extends StatelessWidget {
  const RemovableGroundsForm({super.key, required this.data});

  final RemovableGroundsData data;

  List<Cell> createCells() {
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
        initialValue: data.groundSurfaceArea,
        setter: data.setGroundSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.groundDepth,
        setter: data.setGroundDepth,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.removableAmount,
        setter: data.setRemovableAmount,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.removableGroundTons,
        setter: data.setRemovableGroundTons,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.removableCleanGroundShare,
        setter: data.setRemovableCleanGroundShare,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.contaminatedGroundShare,
        setter: data.setContaminatedGroundShare,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.asphaltSurfaceArea,
        setter: data.setAsphaltSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.asphaltTons,
        setter: data.setAsphaltTons,
      ),
    ];

    return cells;
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
      children: createCells(),
    );
  }
}
