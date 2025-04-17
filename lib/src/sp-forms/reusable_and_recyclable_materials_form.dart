import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/sp-bloc/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/sp-bloc/reusable_and_recyclable_materials_event.dart';
import 'package:flutter_app/src/sp-bloc/total_reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ReusableAndRecyclableMaterialsForm extends StatelessWidget {
  const ReusableAndRecyclableMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc =
        context.read<SmallPropertiesReusableAndRecyclableMaterialsBloc>();

    return BlocBuilder<SmallPropertiesTotalReusableAndRecyclableMaterialsBloc,
            SmallPropertiesTotalReusableAndRecyclableMaterials>(
        builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LayoutGrid(columnSizes: [
          210.px,
          120.px,
          210.px,
          120.px,
          120.px,
          120.px,
          120.px,
        ], rowSizes: [
          75.px,
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
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
        ], children: [
          Cell.header(
            initialValue: 'Hyödyntämiskelpoiset ja kierrätettävät materiaalit',
          ),
          Cell.column(initialValue: 'Määräarvio (tonnia)'),
          Cell.column(
              initialValue: 'Hyödyntäminen, käsittely tai loppusijoituspaikka'),
          Cell.column(initialValue: 'Käsittely- ja prukukustannus (€/tonni)'),
          Cell.column(initialValue: 'Purkukustannus/materiaalierä (€)'),
          Cell.column(initialValue: 'Materiaalin arvo (€/tonni)'),
          Cell.column(initialValue: 'materiaalierän hinta (€)'),
          Cell.row(initialValue: "Maa-ainekset"),
          Cell.output(getter: () => state.cleanSoil.quantityEstimate),
          Cell.input(
            initialValue:
                state.cleanSoil.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue:
                state.reusableAndRecyclableMaterials?.cleanSoilDemolitionCost,
            setter: (value) => bloc.add(CleanSoilDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.cleanSoil.materialValue),
          Cell.row(initialValue: "Asfalttijäte"),
          Cell.output(getter: () => state.asphaltWaste.quantityEstimate),
          Cell.input(
            initialValue:
                state.asphaltWaste.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state
                .reusableAndRecyclableMaterials?.asphaltWasteDemolitionCost,
            setter: (value) =>
                bloc.add(AsphaltWasteDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.cleanConcrete.materialValue),
          Cell.row(initialValue: "Puhdas betoni"),
          Cell.output(getter: () => state.cleanConcrete.quantityEstimate),
          Cell.input(
            initialValue: state
                .reusableAndRecyclableMaterials?.cleanConcreteDemolitionCost,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.cleanConcrete?.cleanSoilDemolitionCost,
            setter: (value) =>
                bloc.add(CleanConcreteDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.steel.materialValue),
          Cell.row(initialValue: "Betoniteräkset, peltikatto ja muu teräsromu"),
          Cell.output(getter: () => state.steel.quantityEstimate),
          Cell.input(
            initialValue: state.steel.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.reinforcedConcreteSheetMetalRoofAndMoreDemolitionCost,
            setter: (value) => bloc.add(
                ReinforcedConcreteSheetMetalRoofAndMoreDemolitionCostChanged(
                    value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.steel.materialValue),
          Cell.row(initialValue: "Seinä- ja kattotiilet"),
          Cell.output(getter: () => state.wallAndRoofTiles.quantityEstimate),
          Cell.input(
            initialValue: state
                .wallAndRoofTiles.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.wallAndCeilingTilesDemolitionCost,
            setter: (value) =>
                bloc.add(WallAndCeilingTilesDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.wallAndRoofTiles.materialValue),
          Cell.row(initialValue: "Puhdas käyttökelpoinen puu"),
          Cell.output(getter: () => state.cleanUsableWood.quantityEstimate),
          Cell.input(
            initialValue:
                state.cleanUsableWood.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.cleanReusableWoodDemolitionCost,
            setter: (value) =>
                bloc.add(CleanReusableWoodDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.cleanUsableWood.materialValue),
          Cell.row(initialValue: "Tuulensuojalevyt (bituliitti tai vastaava)"),
          Cell.output(getter: () => state.windProtectionBoard.quantityEstimate),
          Cell.input(
            initialValue: state
                .windProtectionBoard.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.windProtectionSheetBitumenOrSimilarDemolitionCost,
            setter: (value) => bloc.add(
                WindProtectionSheetBitumenOrSimilarDemolitionCostChanged(
                    value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.windProtectionBoard.materialValue),
          Cell.row(initialValue: "Lasi- ja mineraalieristevilla"),
          Cell.output(getter: () => state.glassAndMineralWool.quantityEstimate),
          Cell.input(
            initialValue: state
                .glassAndMineralWool.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.glassAndMineralInsulationWoolDemolitionCost,
            setter: (value) => bloc
                .add(GlassAndMineralInsulationWoolDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.gypsumBoards.materialValue),
          Cell.row(initialValue: "Kipsilevyt (Cyproc)"),
          Cell.output(getter: () => state.gypsumBoards.quantityEstimate),
          Cell.input(
            initialValue:
                state.gypsumBoards.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state
                .reusableAndRecyclableMaterials?.cybrocSheetsDemolitionCost,
            setter: (value) =>
                bloc.add(CybrocSheetsDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.gypsumBoards.materialValue),
          Cell.row(initialValue: "Lastulevy"),
          Cell.output(getter: () => state.chipboard.quantityEstimate),
          Cell.input(
            initialValue:
                state.chipboard.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue:
                state.reusableAndRecyclableMaterials?.chipboardDemolitionCost,
            setter: (value) => bloc.add(ChipboardDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.chipboard.materialValue),
          Cell.row(
              initialValue:
                  "Energiajäte, maalattu puu, kattohuopa ja aluskate"),
          Cell.output(getter: () => state.energyWaste.quantityEstimate),
          Cell.input(
            initialValue:
                state.energyWaste.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.energyWastePaintedWoodRoofingFeltAndUnderLaymentDemolitionCost,
            setter: (value) => bloc.add(
                EnergyWastePaintedWoodRoofingFeltAndUnderLaymentDemolitionCostChanged(
                    value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.energyWaste.materialValue),
          Cell.row(initialValue: "Lasi"),
          Cell.output(getter: () => state.glass.quantityEstimate),
          Cell.input(
            initialValue: state.glass.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue:
                state.reusableAndRecyclableMaterials?.glassDemolitionCost,
            setter: (value) => bloc.add(GlassDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.glass.materialValue),
          Cell.row(initialValue: "Alumiini"),
          Cell.output(getter: () => state.aluminium.quantityEstimate),
          Cell.input(
            initialValue:
                state.aluminium.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue:
                state.reusableAndRecyclableMaterials?.aluminiumDemolitionCost,
            setter: (value) => bloc.add(AluminiumDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.aluminium.materialValue),
          Cell.row(
              initialValue:
                  "Muu metalliromu, sähkökaapit, liedet, jääkaapit ym."),
          Cell.output(getter: () => state.rebarAndSteelScrap.quantityEstimate),
          Cell.input(
            initialValue: state
                .rebarAndSteelScrap.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state
                .reusableAndRecyclableMaterials?.otherMetalScrapDemolitionCost,
            setter: (value) =>
                bloc.add(OtherMetalScrapDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.rebarAndSteelScrap.materialValue),
          Cell.row(initialValue: "Ruostumaton teräs"),
          Cell.output(getter: () => state.stainlessSteel.quantityEstimate),
          Cell.input(
            initialValue:
                state.stainlessSteel.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state
                .reusableAndRecyclableMaterials?.stainlessSteelDemolitionCost,
            setter: (value) =>
                bloc.add(StainlessSteelDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.stainlessSteel.materialValue),
          Cell.row(initialValue: "Kupari"),
          Cell.output(getter: () => state.copper.quantityEstimate),
          Cell.input(
            initialValue:
                state.copper.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue:
                state.reusableAndRecyclableMaterials?.copperDemolitionCost,
            setter: (value) => bloc.add(CopperDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.copper.materialValue),
          Cell.row(initialValue: "Betoniset pihalaatat ja muurikivet"),
          Cell.output(getter: () => state.concreteBlocks.quantityEstimate),
          Cell.input(
            initialValue:
                state.concreteBlocks.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => null, //TODO: fix this
          ),
          Cell.input(
            initialValue: state.reusableAndRecyclableMaterials
                ?.concreteYardTilesAndStonesDemolitionCost,
            setter: (value) => bloc
                .add(ConcreteYardTilesAndStonesDemolitionCostChanged(value)),
          ),
          Cell.output(getter: () => null), //TODO: fix this
          Cell.input(initialValue: null, setter: (value) => null),
          Cell.output(getter: state.concreteBlocks.materialValue),
          Cell.row(initialValue: "Hyödyntämiskelpoiset materiaalit yhteensä"),
          Cell.output(getter: () => state.totalQuantityEstimate),
          Cell.grey(),
          Cell.grey(),
          Cell.output(getter: () => state.totalDemolitionCost), //TODO: fix this
          Cell.grey(),
          Cell.output(getter: () => state.totalMaterialPrice),
          Cell.grey(),
        ])
      ]);
    });
  }
}
