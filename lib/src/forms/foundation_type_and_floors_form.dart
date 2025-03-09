import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/foundation_type_and_foors_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Perustyyppi ja lattiat
class FoundationTypeAndFloorsForm extends StatelessWidget {
  const FoundationTypeAndFloorsForm({super.key, required this.data});

  final FoundationTypeAndFloorsData data;

  List<Widget> createCells() {
    final cells = [
      Cell(type: CellType.header, initialValue: 'Perustyyppi ja lattiat'),
      Cell(
        type: CellType.column,
        initialValue: 'Valesokkeli',
      ),
      Cell(type: CellType.column, initialValue: 'Rossipohja'),
      Cell(type: CellType.column, initialValue: 'Matalaperustus'),
      Cell(type: CellType.column, initialValue: 'Pilariperustus'),
      Cell(type: CellType.column, initialValue: 'Ontelolaattaperustus'),
      Cell(type: CellType.column, initialValue: 'Koko rakennus yht.'),
      Cell(type: CellType.header, initialValue: 'Perustuksen pinta-ala (m2)'),
      Cell(
        type: CellType.input,
        initialValue: data.fakePlinthSurfaceArea,
        setter: data.setFakePlinthSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.baseFloorSurfaceArea,
        setter: data.setBaseFloorSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.shallowFoundationSurfaceArea,
        setter: data.setShallowFoundationSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.pillarFoundationSurfaceArea,
        setter: data.setPillarFoundationSurfaceArea,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.cavitySlabSurfaceArea,
        setter: data.setCavitySlabSurfaceArea,
      ),
      OutputCell(
        data: data,
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
      ],
      rowSizes: [50.px, 50.px],
      children: createCells(),
    );
  }
}
