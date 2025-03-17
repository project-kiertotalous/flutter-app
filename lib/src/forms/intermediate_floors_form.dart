import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class IntermediateFloorsForm extends StatelessWidget {
  const IntermediateFloorsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final intermediateFloorsBloc = context.read<IntermediateFloorsBloc>();

    return BlocBuilder<IntermediateFloorsBloc, IntermediateFloors>(
      builder: (context, state) {
        return Column(
          children: [
            // First LayoutGrid
            LayoutGrid(
              columnSizes: [
                150.px, // First column: Header text "Välipohjien pinta-alat ja runkorakenteet"
                120.px, // Second column: Checkbox and Header for the percentage and area
                120.px, // Third column: Input and Output for "Puurunko"
              ],
              rowSizes:
                  List.filled(7, 50.px), // 7 rows with height of 50px each
              children: [
                // Row 1: Header text "Välipohjien pinta-alat ja runkorakenteet"
                Cell(
                    type: CellType.header,
                    initialValue: "Välipohjien pinta-alat ja runkorakenteet"),
                Cell(type: CellType.empty), // Empty cell
                Cell(type: CellType.empty), // Empty cell
                Cell(
                    type: CellType.empty,
                    initialValue:
                        "Ontelolaatat ja liimapalkit ovat kierrätettävissä"),
                Cell(
                    type: CellType.header,
                    initialValue: "Rakenteen osuus koko kerrosalasta (%)"),
                Cell(
                    type: CellType.header,
                    initialValue: "Lattiapinta-ala (m²)"),

                // Row 2: Puurunko (m²)
                Cell(type: CellType.row, initialValue: "Puurunko (m²)"),
                Cell(
                    type: CellType.input,
                    initialValue: state.woodFramePercentageFraction),
                OutputCell(
                    getter: () =>
                        null), // Output cell with getter returning null

                // Row 3: Betonivalu, oletuspaksuus 200 mm (m²)
                Cell(
                    type: CellType.row,
                    initialValue: "Betonivalu, oletuspaksuus 200 mm (m²)"),
                Cell(
                    type: CellType.input,
                    initialValue: state.concreteCastingPercentageFraction),
                OutputCell(
                    getter: () =>
                        null), // Output cell with getter returning null

                // Row 4: Ontelolaatta (m²)
                Cell(type: CellType.row, initialValue: "Ontelolaatta (m²)"),
                Cell(
                    type: CellType.input,
                    initialValue: state.hollowCoreSlabPercentageFraction),
                OutputCell(
                    getter: () =>
                        null), // Output cell with getter returning null

                // Row 5: Liimapalkki, oletusmäärä 0,4 jm/m² (m²)
                Cell(
                    type: CellType.row,
                    initialValue: "Liimapalkki, oletusmäärä 0,4 jm/m² (m²)"),
                Cell(
                    type: CellType.input,
                    initialValue: state.glulamBeamPercentageFraction),
                OutputCell(
                    getter: () =>
                        null), // Output cell with getter returning null

                // Row 6: Välipohjien lattiapinta-alat yhteensä (% / kerrosala yhteensä m²)
                Cell(
                    type: CellType.row,
                    initialValue:
                        "Välipohjien lattiapinta-alat yhteensä (% / kerrosala yhteensä m²)"),
                OutputCell(
                    getter: () =>
                        null), // Output cell with getter returning null
                OutputCell(
                    getter: () =>
                        null), // Output cell with getter returning null
              ],
            ),

            // Space between the grids
            const SizedBox(height: 20),

            // Second LayoutGrid
            LayoutGrid(
              columnSizes: [
                150.px, // First column: Header text "Välipohjien pinta-alat ja runkorakenteet"
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
              ],
              rowSizes: List.filled(5, 50.px), // 5 rows, each 50px tall
              children: [
                // Headers for the 6 columns
                Cell(type: CellType.header, initialValue: 'Rakenne'),
                Cell(type: CellType.header, initialValue: '(m³)'),
                Cell(type: CellType.header, initialValue: '(tonnia)'),
                Cell(type: CellType.header, initialValue: 'Betonia (m³)'),
                Cell(type: CellType.header, initialValue: 'Betoni (tonnia)'),
                Cell(
                    type: CellType.header,
                    initialValue: 'Betoniteräs (tonnia)'),

                // Row 1: Puurunko
                Cell(type: CellType.row, initialValue: 'Puurunko'),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),

                // Row 2: Betonivalu
                Cell(type: CellType.row, initialValue: 'Betonivalu'),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),

                // Row 3: Ontelolaatta
                Cell(type: CellType.row, initialValue: 'Ontelolaatta'),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),

                // Row 4: Liimapalkki
                Cell(type: CellType.row, initialValue: 'Liimapalkki'),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
                Cell(type: CellType.empty),
              ],
            ),
          ],
        );
      },
    );
  }
}
