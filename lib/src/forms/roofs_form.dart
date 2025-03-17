import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/bloc/total_roofs_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/menu_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RoofsForm extends StatelessWidget {
  const RoofsForm({super.key});

  /// Converts RoofType enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<RoofType?>> _roofTypeToList() {
    return [
      DropdownMenuItem<RoofType?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...RoofType.values.map((type) {
        return DropdownMenuItem<RoofType?>(
          value: type,
          child: Text(_roofTypeToString(type)),
        );
      }),
    ];
  }

  /// Converts WaterRoofType enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<WaterRoofType?>> _waterRoofTypeToList() {
    return [
      DropdownMenuItem<WaterRoofType?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...WaterRoofType.values.map((type) {
        return DropdownMenuItem<WaterRoofType?>(
          value: type,
          child: Text(_waterRoofTypeToString(type)),
        );
      }),
    ];
  }

  /// Converts RoofType enum to a user-friendly display name.
  String _roofTypeToString(RoofType type) {
    switch (type) {
      case RoofType.woodenTruss:
        return 'Puuristikko';
      case RoofType.steelTruss:
        return 'Teräsristikko';
      case RoofType.concreteBeam:
        return 'Betonipalkki';
    }
  }

  /// Converts WaterRoofType enum to a user-friendly display name.
  String _waterRoofTypeToString(WaterRoofType type) {
    switch (type) {
      case WaterRoofType.metalRoof:
        return 'Peltikatto';
      case WaterRoofType.roofingFelt:
        return 'Kattohuopa';
      case WaterRoofType.mineriteRoof:
        return 'Mineriittikate';
      case WaterRoofType.tiledRoof:
        return 'Tiilikate';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalRoofsBloc = context.read<TotalRoofsBloc>();

    return BlocBuilder<TotalRoofsBloc, TotalRoofs>(
      builder: (context, state) {
        return Column(
          children: [
            FormHeader(
              text: 'Katon pinta-ala',
            ),
            LayoutGrid(
              columnSizes: [
                400.px,
                160.px,
                160.px,
              ],
              rowSizes: [
                140.px,
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
              ],
              children: [
                Cell(
                  type: CellType.row,
                  initialValue:
                      'Todellinen, mitatun tai piirustuksen mukainen kattopinta-ala (m2), TAI pohjanalanmukainen oletusmitoitus',
                  checkbox: true,
                  checkboxSetter: (value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!.call(
                        useDefaultDimensions: value,
                      ),
                    ),
                  ),
                  checkboxTitle: 'Käytä oletusmitoistusta',
                  checkboxValue: state.roofs?.useDefaultDimensions,
                ),
                InputCell(
                  initialValue: state.roofs?.ceilingArea,
                  setter: (value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!.call(
                        ceilingArea: value,
                      ),
                    ),
                  ),
                ),
                Cell(
                  type: CellType.empty,
                ),
                Cell(
                  type: CellType.header,
                  initialValue: 'Kattotyyppi',
                ),
                // TODO: this column needs an InfoButton
                Cell(
                  type: CellType.column,
                  initialValue: 'Pinta-ala (m2)',
                ),
                Cell(
                  type: CellType.column,
                  initialValue: 'Kattotyypin osuus koko kattopinta-alasta (%)',
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Harja-/aumakatto',
                ),
                OutputCell(
                  getter: () => state.ridgeOrGableRoofArea,
                ),
                InputCell(
                  initialValue: state.roofs?.ridgeOrGableRoofPortion,
                  setter: (value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!.call(
                        ridgeOrGableRoofPortion: value,
                      ),
                    ),
                  ),
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Tasa-/pulpettikatto',
                ),
                OutputCell(
                  getter: () => state.flatOrMonoPitchedRoofArea,
                ),
                OutputCell(
                  getter: () => state.roofs?.flatOrMonoPitchedRoofPortion,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Koko kattopinta-ala (m2)',
                ),
                OutputCell(
                  getter: () => state.calculatedCeilingArea,
                ),
                Cell(
                  type: CellType.empty,
                ),
                Cell(
                  type: CellType.header,
                  initialValue: 'Rakenne ja materiaalit',
                ),
                MenuCell<RoofType>(
                  setter: (RoofType? value) => totalRoofsBloc.add(
                      TotalRoofsChanged(state.copyWith.roofs!
                          .call(ridgeOrGableRoofType: value))),
                  initialValue: state.roofs?.ridgeOrGableRoofType,
                  items: _roofTypeToList(),
                ),
                MenuCell<RoofType>(
                  setter: (RoofType? value) {
                    totalRoofsBloc.add(TotalRoofsChanged(state.copyWith.roofs!
                        .call(flatOrMonoPitchedRoofType: value)));
                  },
                  initialValue: state.roofs?.flatOrMonoPitchedRoofType,
                  items: _roofTypeToList(),
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Vesikatto',
                  checkbox: true,
                  checkboxSetter: (value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!.call(
                        roofTrussesAreRecyclable: value,
                      ),
                    ),
                  ),
                  checkboxTitle: 'Kattoristikot kierrätettävissä',
                  checkboxValue: state.roofs?.roofTrussesAreRecyclable,
                ),
                MenuCell<WaterRoofType>(
                  setter: (WaterRoofType? value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!
                          .call(ridgeOrGableWaterRoofType: value),
                    ),
                  ),
                  initialValue: state.roofs?.ridgeOrGableWaterRoofType,
                  items: _waterRoofTypeToList(),
                ),
                MenuCell<WaterRoofType>(
                  setter: (WaterRoofType? value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!
                          .call(flatOrMonoPitchedWaterRoofType: value),
                    ),
                  ),
                  initialValue: state.roofs?.flatOrMonoPitchedWaterRoofType,
                  items: _waterRoofTypeToList(),
                ),
                Cell(
                  type: CellType.header,
                  initialValue: 'Katon purkumateriaalimäärät',
                ),
                Cell(
                  type: CellType.column,
                  initialValue: 'm3',
                ),
                Cell(
                  type: CellType.column,
                  initialValue: 'Tonnia',
                ),
                Cell(
                  type: CellType.row,
                  initialValue:
                      'Puuta (kattoristikot, aluslaudoitus ja kannattimet)',
                ),
                OutputCell(
                  getter: () => state.woodVolume,
                ),
                OutputCell(
                  getter: () => state.woodTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Terästä (teräsristikot, kattopellit)',
                ),
                OutputCell(
                  // there doesn't seem to be a getter for this in TotalRoofs
                  getter: () {},
                ),
                OutputCell(
                  getter: () => state.steelTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Betoni',
                ),
                OutputCell(
                  getter: () => state.concreteVolume,
                ),
                OutputCell(
                  getter: () => state.concreteTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Lasi- ja mineraalieristevilla',
                ),
                OutputCell(
                  getter: () => state.insulationVolume,
                ),
                OutputCell(
                  getter: () => state.insulationTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Aluskate',
                ),
                OutputCell(
                  getter: () => state.underlayVolume,
                ),
                OutputCell(
                  getter: () => state.underlayTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Bitumikermikate (kattohuopa)',
                ),
                OutputCell(
                  getter: () => state.bitumenVolume,
                ),
                OutputCell(
                  getter: () => state.bitumenTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Mineriittikate',
                ),
                OutputCell(
                  getter: () => state.mineriteVolume,
                ),
                OutputCell(
                  getter: () => state.mineriteTons,
                ),
                Cell(
                  type: CellType.row,
                  initialValue: 'Kattotiilet',
                ),
                OutputCell(
                  getter: () => state.roofTileVolume,
                ),
                OutputCell(
                  getter: () => state.roofTileTons,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
