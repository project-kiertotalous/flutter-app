import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class IntermediateFloorsForm extends StatelessWidget {
  const IntermediateFloorsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final intermediateFloorsBloc = context.read<IntermediateFloorsBloc>();

    return BlocBuilder<IntermediateFloorsBloc, TotalIntermediateFloors>(
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
                    320.px,
                    120.px,
                    120.px,
                  ],
                  rowSizes: List.filled(7, 50.px),
                  children: [
                    // Add FormHeader here
                    FormHeader(
                      text: 'Välipohjien pinta-alat ja runkorakenteet',
                    ),
                    Cell(type: CellType.empty),
                    Cell(type: CellType.empty),
                    Cell(
                      type: CellType.row,
                      initialValue: "",
                      checkbox: true,
                      checkboxValue:
                          state.hollowCoreSlabsAndGlulamBeamRecyclable,
                      checkboxTitle:
                          "Ontelolaatat ja liimapalkit ovat kierrätettäviä",
                      checkboxSetter: (value) => intermediateFloorsBloc.add(
                        HollowCoreSlabsAndGlulamBeamRecyclableChanged(value),
                      ),
                    ),
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
                      initialValue: state.woodFramePercentageFraction,
                      percentage: true,
                      setter: (value) => intermediateFloorsBloc
                          .add(WoodFramePercentageChanged(value)),
                    ),
                    OutputCell(getter: () => state.woodFrameFloorArea),
                    Cell(
                        type: CellType.row,
                        initialValue: "Betonivalu, oletuspaksuus 200 mm (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.concreteCastingPercentageFraction,
                        percentage: true,
                        setter: (value) => intermediateFloorsBloc
                            .add(ConcreteCastingPercentageChanged(value))),
                    OutputCell(getter: () => state.concreteCastingFloorArea),
                    Cell(type: CellType.row, initialValue: "Ontelolaatta (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.hollowCoreSlabPercentageFraction,
                        percentage: true,
                        setter: (value) => intermediateFloorsBloc
                            .add(HollowCoreSlabPercentageChanged(value))),
                    OutputCell(getter: () => state.hollowCoreSlabFloorArea),
                    Cell(
                        type: CellType.row,
                        initialValue:
                            "Liimapalkki, oletusmäärä 0,4 jm/m² (m²)"),
                    Cell(
                        type: CellType.input,
                        initialValue: state.glulamBeamPercentageFraction,
                        percentage: true,
                        setter: (value) => intermediateFloorsBloc
                            .add(GlulamBeamPercentageChanged(value))),
                    OutputCell(getter: () => state.glulamBeamFloorArea),
                    Cell(
                        type: CellType.row,
                        initialValue:
                            "Välipohjien lattiapinta-alat yhteensä (% / kerrosala yhteensä m²)"),
                    OutputCell(
                      getter: () => state.totalFraction,
                      percentage: true,
                    ),
                    OutputCell(getter: () => state.totalFloorArea),
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
                    OutputCell(getter: () => state.woodFrameWoodVolume),
                    OutputCell(getter: () => state.woodFrameWoodTons),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    Cell(type: CellType.row, initialValue: 'Betonivalu'),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(
                        getter: () => state.concreteCastingConcreteVolume),
                    OutputCell(getter: () => state.concreteCastingConcreteTons),
                    OutputCell(getter: () => state.concreteCastingRebarTons),
                    Cell(type: CellType.row, initialValue: 'Ontelolaatta'),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(
                        getter: () => state.hollowCoreSlabConcreteVolume),
                    OutputCell(getter: () => state.hollowCoreSlabConcreteTons),
                    OutputCell(getter: () => ""),
                    Cell(type: CellType.row, initialValue: 'Liimapalkki'),
                    OutputCell(getter: () => state.glulamBeamWoodVolume),
                    OutputCell(getter: () => state.glulamBeamWoodTons),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
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
