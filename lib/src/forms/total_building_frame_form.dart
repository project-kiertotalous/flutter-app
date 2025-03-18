import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/info_button.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class TotalBuildingFrameForm extends StatelessWidget {
  const TotalBuildingFrameForm({super.key});

  @override
  Widget build(BuildContext context) {
    final totalBuildingFrameBloc = context.read<TotalBuildingFrameBloc>();

    return BlocBuilder<TotalBuildingFrameBloc, TotalBuildingFrame>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(
            text: 'Rakennuksen runko',
          ),
          LayoutGrid(
            columnSizes: [
              400.px,
              160.px,
              160.px,
            ],
            rowSizes: [
              100.px,
              50.px,
            ],
            children: [
              Cell(
                type: CellType.row,
                initialValue: 'Ulkoseinien kehämitta (jm)',
                iconButton: InfoButton(),
                checkbox: true,
                checkboxTitle: 'Käytä perustuksen kehämittaa',
                checkboxValue:
                    state.buildingFrame?.useFoundationCircumference ?? false,
                checkboxSetter: (value) => {},
              ),
              OutputCell(getter: () {}),
              InputCell(
                initialValue: state.buildingFrame?.externalWallsPerimeter,
                setter: () {},
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Ulkoseinien keskikorkeus (m)',
              ),
              InputCell(
                initialValue: state.buildingFrame?.externalWallsAverageHeight,
                setter: () {},
              ),
              Cell(
                type: CellType.empty,
              ),
            ],
          ),
          // empty space between forms
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          LayoutGrid(
            columnSizes: [
              400.px,
              160.px,
              160.px,
              160.px,
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
            ],
            children: [
              Cell(
                type: CellType.row,
                initialValue: 'Rakennemateriaalit',
                // checkbox: true,
                // checkboxTitle:
                //     'Liima-, betoni-, teräs- ja betonielementit ovat kierrätettäviä',
                // checkboxValue: state.buildingFrame?.areMaterialsRecyclable,
                // checkboxSetter: () {
                //   print('y');
                // },
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Osuus (%)',
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
                initialValue: 'Puurunko',
                iconButton: InfoButton(),
              ),
              InputCell(
                initialValue: 0,
                setter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Liimapalkit',
                iconButton: InfoButton(),
              ),
              InputCell(
                initialValue: 0,
                setter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Betonipalkit',
                iconButton: InfoButton(),
              ),
              InputCell(
                initialValue: 0,
                setter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Teräspalkit',
                iconButton: InfoButton(),
              ),
              InputCell(
                initialValue: 0,
                setter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Kantavat tiiliseinät',
                iconButton: InfoButton(),
              ),
              InputCell(
                initialValue: 0,
                setter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              Cell(
                type: CellType.row,
                initialValue: 'Betonielementit',
                iconButton: InfoButton(),
              ),
              InputCell(
                initialValue: 0,
                setter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              Cell(
                type: CellType.header,
                initialValue: 'Yhteenveto',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Seinien pinta-alat yhteensä (m2)',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Kokonaismäärät (m3)',
              ),
              Cell(
                type: CellType.column,
                initialValue: 'Kokonaismäärät (tonnia)',
              ),
              // errors should be displayed here
              Cell(type: CellType.empty),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
              OutputCell(
                getter: () {},
              ),
            ],
          ),
        ],
      );
    });
  }
}
