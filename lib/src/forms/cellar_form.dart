import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/cellar_bloc.dart';
import 'package:flutter_app/src/bloc/cellar_event.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/menu_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
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
                FormHeader(text: 'Kellari'),
                EmptyCell(),
                EmptyCell(),
                RowCell(initialValue: 'Kellarin lattia-ala (m²)'),
                InputCell(
                  initialValue: state.floorArea,
                  setter: (value) =>
                      cellarBloc.add(CellarFloorAreaChanged(value)),
                ),
                EmptyCell(),
                RowCell(initialValue: 'Kellarin ulkoseinien kehämitta (jm)'),
                InputCell(
                  initialValue: state.exteriorWallsPerimeter,
                  setter: (value) =>
                      cellarBloc.add(CellarPerimeterChanged(value)),
                ),
                MenuCell<CellarExteriorMaterial?>(
                  setter: (value) =>
                      cellarBloc.add(CellarMaterialChanged(value)),
                  initialValue: state.exteriorWallsMaterial,
                  items: toList(),
                ),
                RowCell(initialValue: 'Kellarin seinän korkeus (m)'),
                InputCell(
                  initialValue: state.wallHeight,
                  setter: (value) =>
                      cellarBloc.add(CellarWallHeightChanged(value)),
                ),
                EmptyCell(),
              ],
            ),

            SizedBox(height: 20), // Space before next grid

            // New grid for demolition materials
            LayoutGrid(
              columnSizes: [150.px, 120.px, 120.px], // Adjusted column widths
              rowSizes: List.filled(9, 50.px), // 1 header row + 8 material rows
              children: [
                FormHeader(
                    text:
                        "Kellarin lattian ja ulkoseinien purkumateriaalimäärät"),
                RowCell(initialValue: "Tonnia"),
                RowCell(initialValue: "m³"),
                RowCell(initialValue: "Betonia"),
                OutputCell(getter: () => state.concreteTons),
                OutputCell(getter: () => state.concreteVolume),
                RowCell(initialValue: "Betoniterästä"),
                OutputCell(getter: () => state.rebarTons),
                OutputCell(getter: () => ''),
                RowCell(initialValue: "Tiiliä"),
                OutputCell(getter: () => state.brickTons),
                OutputCell(getter: () => state.brickVolume),
                RowCell(initialValue: "Harkkoja"),
                OutputCell(getter: () => state.blockTons),
                OutputCell(getter: () => state.blockVolume),
                RowCell(initialValue: "Lasi- ja mineraalieristevilla (tonnia)"),
                OutputCell(
                    getter: () => state.glassAndMineralWoolInsulationTons),
                OutputCell(
                    getter: () => state.glassAndMineralWoolInsulationVolume),
                RowCell(
                    initialValue: "Muovijäte, styrox, kosteuseriste yms. (m3)"),
                OutputCell(getter: () => state.plasticWasteTons),
                OutputCell(getter: () => state.plasticWasteVolume),
                RowCell(initialValue: "Kuumabitumisively"),
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
