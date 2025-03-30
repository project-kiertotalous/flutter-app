import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
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
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                LayoutGrid(
                    columnSizes: List.filled(3, 130.px),
                    rowSizes: List.filled(2, 50.px),
                    children: [
                      FormHeader(text: "Välipohjat"),
                      ColumnCell(initialValue: "Kerrosala (m2)"),
                      ColumnCell(initialValue: "Kerroksia (kpl)"),
                      RowCell(
                          initialValue:
                              "Välipohjien laskennassa käytetyt arvot"),
                      OutputCell(
                          getter: () =>
                              state.totalBuildingDimensions?.grossFloorArea),
                      OutputCell(
                          getter: () => state.totalBuildingDimensions
                              ?.floorCountExcludingBasements),
                    ]),
                const SizedBox(height: 10),
                LayoutGrid(
                  columnSizes: [
                    345.px,
                    120.px,
                    120.px,
                  ],
                  rowSizes: List.filled(7, 50.px),
                  children: [
                    FormHeader(
                      text: 'Välipohjien pinta-alat ja runkorakenteet',
                    ),
                    EmptyCell(),
                    EmptyCell(),
                    RowCell(
                      initialValue: "",
                      checkbox: true,
                      checkboxValue:
                          state.hollowCoreSlabsAndGlulamBeamRecyclable,
                      checkboxTitle:
                          "Ontelolaatat ja liimapalkit ovat kierrätettäviä",
                      checkboxSetter: (value) => intermediateFloorsBloc.add(
                          HollowCoreSlabsAndGlulamBeamRecyclableChanged(value)),
                    ),
                    ColumnCell(
                        initialValue: "Rakenteen osuus koko kerrosalasta (%)"),
                    ColumnCell(initialValue: "Lattiapinta-ala (m²)"),
                    RowCell(initialValue: "Puurunko (m²)"),
                    InputCell(
                      initialValue: state.woodFramePercentageFraction,
                      percentage: true,
                      setter: (value) => intermediateFloorsBloc
                          .add(WoodFramePercentageChanged(value)),
                    ),
                    OutputCell(getter: () => state.woodFrameFloorArea),
                    RowCell(
                        initialValue: "Betonivalu, oletuspaksuus 200 mm (m²)"),
                    InputCell(
                        initialValue: state.concreteCastingPercentageFraction,
                        percentage: true,
                        setter: (value) => intermediateFloorsBloc
                            .add(ConcreteCastingPercentageChanged(value))),
                    OutputCell(getter: () => state.concreteCastingFloorArea),
                    RowCell(initialValue: "Ontelolaatta (m²)"),
                    InputCell(
                        initialValue: state.hollowCoreSlabPercentageFraction,
                        percentage: true,
                        setter: (value) => intermediateFloorsBloc
                            .add(HollowCoreSlabPercentageChanged(value))),
                    OutputCell(getter: () => state.hollowCoreSlabFloorArea),
                    RowCell(
                        initialValue:
                            "Liimapalkki, oletusmäärä 0,4 jm/m² (m²)"),
                    InputCell(
                        initialValue: state.glulamBeamPercentageFraction,
                        percentage: true,
                        setter: (value) => intermediateFloorsBloc
                            .add(GlulamBeamPercentageChanged(value))),
                    OutputCell(getter: () => state.glulamBeamFloorArea),
                    RowCell(
                        initialValue:
                            "Välipohjien lattiapinta-alat yhteensä (% / kerrosala yhteensä m²)"),
                    OutputCell(
                      getter: () => state.totalFraction,
                      percentage: true,
                    ),
                    OutputCell(getter: () => state.totalFloorArea),
                  ],
                ),
                const SizedBox(height: 20),
                LayoutGrid(
                  columnSizes: List.filled(3, 50.px),
                  rowSizes: List.filled(3, 50.px),
                  children: List.generate(9, (index) => EmptyCell()),
                ),
                const SizedBox(height: 20),
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
                    Cell.header(initialValue: 'Rakenne'),
                    ColumnCell(initialValue: 'Puuta (m³)'),
                    ColumnCell(initialValue: 'Puuta (tonnia)'),
                    ColumnCell(initialValue: 'Betonia (m³)'),
                    ColumnCell(initialValue: 'Betoni (tonnia)'),
                    ColumnCell(initialValue: 'Betoniteräs (tonnia)'),
                    RowCell(initialValue: 'Puurunko'),
                    OutputCell(getter: () => state.woodFrameWoodVolume),
                    OutputCell(getter: () => state.woodFrameWoodTons),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    RowCell(initialValue: 'Betonivalu'),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(
                        getter: () => state.concreteCastingConcreteVolume),
                    OutputCell(getter: () => state.concreteCastingConcreteTons),
                    OutputCell(getter: () => state.concreteCastingRebarTons),
                    RowCell(initialValue: 'Ontelolaatta'),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(
                        getter: () => state.hollowCoreSlabConcreteVolume),
                    OutputCell(getter: () => state.hollowCoreSlabConcreteTons),
                    OutputCell(getter: () => ""),
                    RowCell(initialValue: 'Liimapalkki'),
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
