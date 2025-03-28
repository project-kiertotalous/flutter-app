import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_frame_event.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/info_button.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class TotalBuildingFrameForm extends StatelessWidget {
  const TotalBuildingFrameForm({super.key});

  @override
  Widget build(BuildContext context) {
    final totalBuildingFrameBloc = context.read<TotalBuildingFrameBloc>();

    return BlocBuilder<TotalBuildingFrameBloc, TotalBuildingFrame>(
        builder: (context, state) {
      return BlocListener<FoundationsBloc, Foundations>(
        listener: (context, foundationsState) {
          // updates TotalBuildingFrame.totalFoundations when
          // Foundations is changed in FoundationsBloc
          totalBuildingFrameBloc.add(FoundationsChanged(foundationsState));
        },
        child: Column(
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
                RowCell(
                  initialValue: 'Ulkoseinien kehämitta (jm)',
                  iconButton: InfoButton(),
                  checkbox: true,
                  checkboxTitle: 'Käytä perustuksen kehämittaa',
                  checkboxValue:
                      state.buildingFrame?.useFoundationCircumference ?? false,
                  checkboxSetter: (value) => {},
                ),
                // TODO: getter doesn't exist?
                OutputCell(getter: () {}),
                InputCell(
                  initialValue: state.buildingFrame?.externalWallsPerimeter,
                  setter: () {},
                ),
                RowCell(
                  initialValue: 'Ulkoseinien keskikorkeus (m)',
                ),
                InputCell(
                  initialValue: state.buildingFrame?.externalWallsAverageHeight,
                  setter: () {},
                ),
                EmptyCell(),
              ],
            ),
            // empty space between forms
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
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
                RowCell(
                  initialValue: 'Rakennemateriaalit',
                  // checkbox: true,
                  // checkboxTitle:
                  //     'Liima-, betoni-, teräs- ja betonielementit ovat kierrätettäviä',
                  // checkboxValue: state.buildingFrame?.areMaterialsRecyclable,
                  // checkboxSetter: () {
                  //   print('y');
                  // },
                ),
                ColumnCell(
                  initialValue: 'Osuus (%)',
                ),
                ColumnCell(
                  initialValue: 'm3',
                ),
                ColumnCell(
                  initialValue: 'Tonnia',
                ),
                RowCell(
                  initialValue: 'Puurunko',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  initialValue:
                      state.buildingFrame?.woodPortionFractionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        woodPortionFractionPercentage: value,
                      ),
                    ),
                  ),
                ),
                OutputCell(
                  getter: () => state.woodVolume,
                ),
                OutputCell(
                  getter: () => state.woodTons,
                ),
                RowCell(
                  initialValue: 'Liimapalkit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  initialValue: state.buildingFrame
                      ?.glulamVerticalColumnsPortionFractionPercentage,
                  setter: () {},
                ),
                // TODO: idk this getter
                OutputCell(
                  getter: () {},
                ),
                // TODO: idk this getter even ~~
                OutputCell(
                  getter: () {},
                ),
                RowCell(
                  initialValue: 'Betonipalkit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  initialValue: state.buildingFrame
                      ?.concreteVerticalColumnsPortionFractionPercentage,
                  setter: () {},
                ),
                OutputCell(
                  getter: () => state.concreteVolume,
                ),
                OutputCell(
                  getter: () => state.concreteTons,
                ),
                RowCell(
                  initialValue: 'Teräspalkit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  initialValue: state.buildingFrame
                      ?.steelVerticalColumnsPortionFractionPercentage,
                  setter: () {},
                ),
                // TODO: this getter is missing
                OutputCell(
                  getter: () {},
                ),
                OutputCell(
                  getter: () => state.steelTons,
                ),
                RowCell(
                  initialValue: 'Kantavat tiiliseinät',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  initialValue: state
                      .buildingFrame?.brickCladWallPortionFractionPercentage,
                  setter: () {},
                ),
                OutputCell(
                  getter: () => state.brickVolume,
                ),
                OutputCell(
                  getter: () => state.brickTons,
                ),
                RowCell(
                  initialValue: 'Betonielementit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  initialValue: state.buildingFrame
                      ?.concreteElementWallsWithoutFrameworkPortionFractionPercentage,
                  setter: () {},
                ),
                // TODO: missing getter
                OutputCell(
                  getter: () {},
                ),
                // TODO: missing getter
                OutputCell(
                  getter: () {},
                ),
                FormHeader(
                  text: 'Yhteenveto',
                ),
                ColumnCell(
                  initialValue: 'Seinien pinta-alat yhteensä (m2)',
                ),
                ColumnCell(
                  initialValue: 'Kokonaismäärät (m3)',
                ),
                ColumnCell(
                  initialValue: 'Kokonaismäärät (tonnia)',
                ),
                // errors should be displayed here
                EmptyCell(),
                OutputCell(
                  getter: () => state.totalStructuralPartsArea,
                ),
                // TODO: missing getter
                OutputCell(
                  getter: () {},
                ),
                // TODO: missing getter
                OutputCell(
                  getter: () {},
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
