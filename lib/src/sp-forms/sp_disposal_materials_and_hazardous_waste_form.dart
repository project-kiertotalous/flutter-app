import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_costs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_notes_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_notes_event.dart';
import 'package:flutter_app/src/sp-bloc/sp_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_disposal_materials_and_hazardous_waste_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SpDisposalMaterialsForm extends StatelessWidget {
  const SpDisposalMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final disposalBloc =
        context.read<SpDisposalMaterialsAndHazardousWasteBloc>();
    final bloc = context.read<TotalDisposalMaterialsAndHazardousWasteBloc>();
    final notesBloc = context.read<DisposableAndHazardousNotesBloc>();
    final costBloc = context.read<DisposableAndHazardousCostsBloc>();

// TODO: this class should actually build according to
// SmallPropertiesTotalDisposalMaterialsAndHazardousWaste,
// but I dont' think it currently has access to everything that's needed here
    return BlocBuilder<TotalDisposalMaterialsAndHazardousWasteBloc,
        TotalDisposalMaterialsAndHazardousWaste>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(
            columnSizes: [
              200.px,
              120.px,
              180.px,
              120.px,
              180.px,
            ],
            rowSizes: [
              75.px,
              75.px,
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
              Cell.header(initialValue: 'Loppusijoitettavat materiaalit'),
              Cell.column(initialValue: 'Määräarvio (tonnia)'),
              Cell.column(
                  initialValue:
                      'Hyödyntäminen, käsittely tai loppusijoituspaikka'),
              Cell.column(
                  initialValue: 'Käsittely- ja purkukustannus (€/tonni)'),
              Cell.column(
                  initialValue:
                      'Purkukustannus ja käsittelukustannus /materiaalierä (€)'),
              //TO-DO fix this later once calculation has been fixed
              Cell.row(
                initialValue:
                    'Käyttökelvoton kaakeli ja posliini, sekä lasi- ja mineraalieristysvilla',
              ),
              Cell.output(
                  getter: () =>
                      state.otherAsbestosContainingMaterial.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.otherAsbestosContainingMaterial
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(CeramicTileNotesChanged(value))),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  UnusableTilePorcelainGlassAndMineralInsulationProcessingCostChanged(
                      value),
                ),
              ),
              Cell.output(
                  getter: () => state
                      .otherAsbestosContainingMaterial.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Kierrätyskelvoton tiilijäte',
              ),
              Cell.output(
                  getter: () => state.nonRecyclableBrickWaste.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.nonRecyclableBrickWaste
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(BrickWasteNotesChanged(value))),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  NonRecyclableBrickWasteProcessingCostChanged(value),
                ),
              ),
              Cell.output(
                  getter: () =>
                      state.nonRecyclableBrickWaste.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Kierrätyskelvoton kipsilevvy',
              ),
              Cell.output(getter: () => state.bitumen.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue:
                      state.bitumen.exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(PlasterBoardNotesChanged(value))),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  NonRecyclablePlasterBoardProcessingCostChanged(value),
                ),
              ),
              Cell.output(
                  getter: () => state
                      .otherAsbestosContainingMaterial.demolitionBatchPrice),
              Cell.header(initialValue: 'Ongelmajätteet'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.row(
                initialValue: 'Saastunut maa',
              ),
              Cell.output(
                  getter: () => state.contaminatedSoil.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.contaminatedSoil
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(ContaminatedSoilNotesChanged(value))),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  ContaminatedSoilProcessingCostChanged(value),
                ),
              ),
              Cell.output(
                  getter: () => state.contaminatedSoil.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Asbestia sisältävä betoni',
              ),
              Cell.output(
                  getter: () => state.asbestosOrBCPConcrete.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.asbestosOrBCPConcrete
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(AsbestosConcreteNotesChanged(value))),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  ConcreteContainingAsbestosProcessingCostChanged(value),
                ),
              ),
              Cell.output(
                  getter: () =>
                      state.asbestosOrBCPConcrete.demolitionBatchPrice),
              //TO-DO fix this later once calculation has been fixed
              Cell.row(
                initialValue: 'Mineriitti- tai huopakate, sisältää asbestia',
              ),
              Cell.output(getter: () => state..quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add((value))),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  (
                      value),
                ),
              ),
              Cell.output(
                  getter: () => state
                      ..demolitionBatchPrice),
                                    //TO-DO fix this later once calculation has been fixed
              Cell.row(initialValue: 'BCP-maalia sisältävä betoni'),
              Cell.output(getter: () {}),
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  ConcreteContainingPcbPaintProcessingCostChanged(value),
                ),
              ),
              Cell.output(getter: () {}),
               Cell.row(
                initialValue: 'Loppusijoitettavat materiaalit yhteensä',
              ),
              Cell.output(
                  getter: () => state.totalTons),
              GreyCell(),
              Cell.output(getter: () => state.totalBatchPrice),
              GreyCell(),
              Cell.output(
                  getter: () =>
                      state.asbestosOrBCPConcrete.demolitionBatchPrice),
              
            ],
          ),
        ],
      );
    });
  }
}
