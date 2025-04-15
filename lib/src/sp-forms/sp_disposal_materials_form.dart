import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';
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

// TODO: this class should actually build according to
// SmallPropertiesTotalDisposalMaterialsAndHazardousWaste,
// but I dont' think it currently has access to everything that's needed here
    return BlocBuilder<SpDisposalMaterialsAndHazardousWasteBloc,
            SmallPropertiesDisposalMaterialsAndHazardousWaste>(
        builder: (context, state) {
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
              Cell.row(
                initialValue:
                    'Käyttökelvoton kaakeli ja posliini, sekä lasi- ja mineraalieristysvilla',
              ),
              Cell.output(getter: () {}),
              // TODO: this string input can't be put anywhere yet; implementation is missing on calculation side
              // TODO: also an inputcell that accepts strings is yet to implement!
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              // TODO: initialValue is missing, but event is sent correctly
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  UnusableTilePorcelainGlassAndMineralInsulationProcessingCostChanged(
                      value),
                ),
              ),
              Cell.output(getter: () {}),
              Cell.row(
                initialValue: 'Kierrätyskelvoton tiilijäte',
              ),
              Cell.output(getter: () {}),
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  NonRecyclableBrickWasteProcessingCostChanged(value),
                ),
              ),
              Cell.output(getter: () {}),
              Cell.row(
                initialValue: 'Kierrätyskelvoton kipsilevy',
              ),
              Cell.output(getter: () {}),
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  NonRecyclablePlasterBoardProcessingCostChanged(value),
                ),
              ),
              Cell.output(getter: () {}),
              Cell.header(initialValue: 'Ongelmajätteet'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.row(initialValue: 'Saastunut maa'),
              Cell.output(getter: () {}),
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  ContaminatedSoilProcessingCostChanged(value),
                ),
              ),
              Cell.output(getter: () {}),
              Cell.row(initialValue: 'Asbestia sisältävä betoni'),
              Cell.output(getter: () {}),
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  ConcreteContainingAsbestosProcessingCostChanged(value),
                ),
              ),
              Cell.output(getter: () {}),
              Cell.row(
                  initialValue: 'Mineriitti- tai huopakate, sisältää asbestia'),
              Cell.output(getter: () {}),
              Cell.input(
                initialValue: 0,
                setter: () {},
              ),
              Cell.input(
                initialValue: 0,
                setter: (value) => disposalBloc.add(
                  MineralWoolOrFeltRoofingContainingAsbestosProcessingCostChanged(
                      value),
                ),
              ),
              Cell.output(getter: () {}),
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
            ],
          ),
        ],
      );
    });
  }
}
