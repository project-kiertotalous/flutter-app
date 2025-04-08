import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/large_properties_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/bloc/large_properties_demolition_waste_and_costs_event.dart';
import 'package:flutter_app/src/bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/header_cell.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class DemolitionWasteAndCostForm extends StatelessWidget {
  const DemolitionWasteAndCostForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DemolitionWasteAndCostsBloc>();

    return BlocBuilder<TotalDemolitionWasteAndCostsBloc,
        TotalDemolitionWasteAndCosts>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(
            columnSizes: [
              200.px,
              200.px,
              200.px,
            ],
            rowSizes: [
              50.px,
              50.px,
              50.px,
            ],
            children: [
              HeaderCell(initialValue: "Purkujätteet ja kustannukset"),
              ColumnCell(initialValue: "Tilavuus (m3)"),
              ColumnCell(initialValue: "Määräarvio (tonnia)"),
              RowCell(initialValue: "Kokonaispurkujätemäärä"),
              OutputCell(getter: () => state.totalVolume),
              OutputCell(getter: () => state.totalTons),
              RowCell(
                  initialValue:
                      "Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata)"),
              OutputCell(getter: () => state.totalVolumeExcludingExcavatedLand),
              OutputCell(getter: () => state.totalTonsExcludingExcavatedLand),
            ],
          ),
          const SizedBox(height: 20),
          LayoutGrid(
            columnSizes: [
              300.px,
              300.px,
            ],
            rowSizes: [
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              RowCell(initialValue: "Purkukustannus (€/tonni)"),
              InputCell(
                initialValue:
                    state.demolitionWasteAndCosts?.demolitionCostPerTon,
                setter: (value) => bloc.add(DemolitionCostPerTonChanged(value)),
              ),
              RowCell(
                  initialValue:
                      "Purkumateriaalien mukaan laskettu purkukustannus (€/tonni)"),
              OutputCell(
                  getter: () => state
                      .demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials),
              RowCell(initialValue: "Purkukustannusarvio (€)"),
              OutputCell(getter: () => state.estimatedDemolitionCost),
              RowCell(
                  initialValue:
                      "Rakennuksen purkukustannus (ei sisällä maanpoistoa)"),
              OutputCell(
                  getter: () =>
                      state.estimatedDemolitionCostExcludingExcavations),
              RowCell(initialValue: "Purkukustannus/neliö (€/m2)"),
              OutputCell(getter: () => state.demolitionCostPerSquareMeter),
              RowCell(initialValue: "Purkukustannus/rakennuskuutio (€/m3)"),
              OutputCell(getter: () => state.demolitionCostPerCubicMeter),
              RowCell(
                  initialValue:
                      "Purkukustannus/rakennuskuutio (ei sisällä maanpoistoa)"),
              OutputCell(
                  getter: () =>
                      state.demolitionCostPerCubicMeterExcludingExcavations),
              RowCell(initialValue: "Myytävät materiaalierät (€)"),
              OutputCell(getter: () => state.sellableMaterialBatchesPrice),
              RowCell(initialValue: "Purettavan rakennuksen kerrosala (m2)"),
              OutputCell(getter: () => state.buildingGrossFloorArea),
              RowCell(initialValue: "Purettavan rakennuksen tilavuus(m3)"),
              OutputCell(getter: () => state.buildingVolume),
            ],
          ),
        ],
      );
    });
  }
}
