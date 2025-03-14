import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/cellar_bloc.dart';
import 'package:flutter_app/src/bloc/cellar_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/menu_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Cellar UI Form
class CellarForm extends StatelessWidget {
  const CellarForm({super.key});

  /// Converts CellarExteriorMaterial enum values to display names
/// and returns them as a list of DropdownMenuItems.
List<DropdownMenuItem<CellarExteriorMaterial?>> toList() {
  return [
    DropdownMenuItem<CellarExteriorMaterial?>(
      value: null,
      child: Text('Valitse'),
    ),
    ...CellarExteriorMaterial.values.map((type) {
      return DropdownMenuItem<CellarExteriorMaterial?>(
        value: type,
        child: Text(typeToString(type)),
      );
    }),
  ];
}

String typeToString(CellarExteriorMaterial type) {
  switch (type) {
    case CellarExteriorMaterial.concreteCasting:
      return "Betonivalu";
    case CellarExteriorMaterial.brick:
      return "Tiiliseinä";
    case CellarExteriorMaterial.concreteBlock:
      return "Harkkoseinä";
  }
}



  @override
  Widget build(BuildContext context) {
    final cellarBloc = context.read<CellarBloc>();

    return BlocBuilder<CellarBloc, Cellar>(
      builder: (context, state) {
        return Column(
          children: [
            // Existing grid for cellar details
            LayoutGrid(
              columnSizes: [150.px, 120.px, 120.px],
              rowSizes: [50.px, 50.px, 50.px, 50.px],
              children: [
                Cell(type: CellType.header, initialValue: 'Kellari'),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),

                Cell(type: CellType.row, initialValue: 'Kellarin lattia-ala (m²)'),
                Cell(
                  type: CellType.input,
                  initialValue: state.floorArea,
                  setter: (value) => cellarBloc.add(CellarFloorAreaChanged(value)),
                ),
                Cell(type: CellType.empty),

                Cell(type: CellType.row, initialValue: 'Kellarin ulkoseinien kehämitta (jm)'),
                Cell(
                  type: CellType.input,
                  initialValue: state.exteriorWallsPerimeter,
                  setter: (value) => cellarBloc.add(CellarPerimeterChanged(value)),
                    ),
                MenuCell<CellarExteriorMaterial?>(
                setter: (value) =>
                  cellarBloc.add(CellarMaterialChanged(value)),
                  initialValue: state.exteriorWallsMaterial,
                  items: toList(),
                  ),
                Cell(type: CellType.row, initialValue: 'Kellarin seinän korkeus (m)'),
                Cell(
                  type: CellType.input,
                  initialValue: state.wallHeight,
                  setter: (value) => cellarBloc.add(CellarWallHeightChanged(value)),
                ),
                Cell(type: CellType.empty),
              ],
            ),

            SizedBox(height: 20), // Space before next grid

            // New grid for demolition materials
            LayoutGrid(
              columnSizes: [150.px, 120.px, 120.px], // Adjusted column widths
              rowSizes: List.filled(9, 50.px), // 1 header row + 8 material rows
              children: [
                Cell(
                    type: CellType.header,
                    initialValue: "Kellarin lattian ja ulkoseinien purkumateriaalimäärät"),
                Cell(type: CellType.header, initialValue: "Tonnia"),
                Cell(type: CellType.header, initialValue: "m³"),

                Cell(type: CellType.row, initialValue: "Betonia"),
                OutputCell(getter: () => state.concreteDemolitionTons),
                OutputCell(getter: () => state.concreteDemolitionVolume),

                Cell(type: CellType.row, initialValue: "Betoniterästä"),
                OutputCell(getter: () => state.rebarTons),
                OutputCell(getter: () => ''),

                Cell(type: CellType.row, initialValue: "Tiiliä"),
                OutputCell(getter: () => state.brickTons),
                OutputCell(getter: () => state.brickVolume),

                Cell(type: CellType.row, initialValue: "Harkkoja"),
                OutputCell(getter: () => state.blockTons),
                OutputCell(getter: () => state.blockVolume),

                Cell(type: CellType.row, initialValue: "Lasi- ja mineraalieristevilla (tonnia)"),
                OutputCell(getter: () => state.glassAndMineralWoolInsulationTons),
                OutputCell(getter: () => state.glassAndMineralWoolInsulationVolume),

                Cell(type: CellType.row, initialValue: "Muovijäte, styrox, kosteuseriste yms. (m3)"),
                OutputCell(getter: () => state.plasticWasteTons),
                OutputCell(getter: () => state.plasticWasteVolume),

                Cell(type: CellType.row, initialValue: "Kuumabitumisively"),
                OutputCell(getter: () => state.hotBitumenCoatingTons),
                OutputCell(getter: () => state.hotBitumenCoatingVolume),
              ],
            ),
          ],
        );
      },
    );
  }
}
