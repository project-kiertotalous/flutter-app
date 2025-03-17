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
        return Align(
          // Aligns everything to the left
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 900, // Keeps both grids aligned
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Left-align content
              children: [
                // First LayoutGrid
                LayoutGrid(
                  columnSizes: [
                    150.px,
                    120.px,
                    120.px,
                  ],
                  rowSizes: List.filled(7, 50.px),
                  children: [
                    Cell(
                        type: CellType.header,
                        initialValue:
                            "Välipohjien pinta-alat ja runkorakenteet"),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(
                        type: CellType.column,
                        initialValue:
                            "Ontelolaatat ja liimapalkit ovat kierrätettäviä"),
                    Cell(
                      type: CellType.column,
                      initialValue: "Rakenteen osuus koko kerrosalasta (%)",
                    ),
                    Cell(
                      type: CellType.column,
                      initialValue: "Lattiapinta-ala (m²)",
                    ),
                    Cell(type: CellType.row, initialValue: "Puurunko (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.woodFramePercentageFraction),
                    OutputCell(getter: () => null),
                    Cell(
                        type: CellType.row,
                        initialValue: "Betonivalu, oletuspaksuus 200 mm (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.concreteCastingPercentageFraction),
                    OutputCell(getter: () => null),
                    Cell(type: CellType.row, initialValue: "Ontelolaatta (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.hollowCoreSlabPercentageFraction),
                    OutputCell(getter: () => null),
                    Cell(
                        type: CellType.row,
                        initialValue:
                            "Liimapalkki, oletusmäärä 0,4 jm/m² (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.glulamBeamPercentageFraction),
                    OutputCell(getter: () => null),
                    Cell(
                        type: CellType.row,
                        initialValue:
                            "Välipohjien lattiapinta-alat yhteensä (% / kerrosala yhteensä m²)"),
                    OutputCell(getter: () => null),
                    OutputCell(getter: () => null),
                  ],
                ),

                const SizedBox(height: 20), // Space between tables

                // Second LayoutGrid
                LayoutGrid(
                  columnSizes: [
                    150.px,
                    150.px,
                    150.px,
                    150.px,
                    150.px,
                    150.px,
                  ],
                  rowSizes: List.filled(5, 50.px),
                  children: [
                    Cell(type: CellType.header, initialValue: 'Rakenne'),
                    Cell(type: CellType.column, initialValue: 'Puuta (m³)'),
                    Cell(type: CellType.column, initialValue: 'Puuta (tonnia)'),
                    Cell(type: CellType.column, initialValue: 'Betonia (m³)'),
                    Cell(
                        type: CellType.column, initialValue: 'Betoni (tonnia)'),
                    Cell(
                        type: CellType.column,
                        initialValue: 'Betoniteräs (tonnia)'),
                    Cell(type: CellType.row, initialValue: 'Puurunko'),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.row, initialValue: 'Betonivalu'),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.row, initialValue: 'Ontelolaatta'),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.row, initialValue: 'Liimapalkki'),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
