import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/foundation_type_and_foors_data.dart';
import 'package:flutter_app/src/data/menu_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
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
      Cell(type: CellType.header, initialValue: 'Monivalinta'),
      MenuCell(
        setter: data.setFakePlinthType,
        initialValue: data.fakePlinthType,
      ),
      MenuCell(
        setter: data.setBaseFloorType,
        initialValue: data.baseFloorType,
      ),
      Cell(
        type: CellType.empty,
        // initialValue: data.shallowFoundationSurfaceArea,
        // setter: data.setShallowFoundationSurfaceArea,
      ),
      MenuCell(
        setter: data.setPillarFoundationType,
        initialValue: data.pillarFoundationType,
      ),
      MenuCell(
        setter: data.setCavitySlabType,
        initialValue: data.cavitySlabType,
      ),
      Cell(
        type: CellType.empty,
      ),
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
        getter: data.getSurfaceAreaTotal,
      ),
      Cell(type: CellType.header, initialValue: 'Perustuksen pinta-ala (m2)'),
      Cell(
        type: CellType.input,
        initialValue: data.fakePlinthCircumference,
        setter: data.setfakePlinthCircumference,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.baseFloorCircumference,
        setter: data.setBaseFloorCircumference,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.shallowFoundationCircumference,
        setter: data.setShallowFoundationCircumference,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.pillarFoundationCircumference,
        setter: data.setPillarFoundationCircumference,
      ),
      Cell(
        type: CellType.input,
        initialValue: data.cavitySlabCircumference,
        setter: data.setCavitySlabCircumference,
      ),
      OutputCell(
        data: data,
        getter: data.getCircumferenceTotal,
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
      rowSizes: [50.px, 50.px, 50.px, 50.px],
      children: createCells(),
    );
  }
}
