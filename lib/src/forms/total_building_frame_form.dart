import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_frame_event.dart';
import 'package:flutter_app/src/data/cell.dart';
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
        // return Container();
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
                RowCell(
                  initialValue: 'Ulkoseinien kehämitta (jm)',
                  iconButton: InfoButton(),
                  checkbox: true,
                  checkboxTitle: 'Käytä perustuksen kehämittaa',
                  checkboxValue:
                      state.buildingFrame?.useFoundationCircumference ?? false,
                  checkboxSetter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        useFoundationCircumference: value,
                      ),
                    ),
                  ),
                ),
                OutputCell(
                  getter: () => state.externalWallsPerimeter,
                ),
                InputCell(
                  initialValue: state.buildingFrame?.externalWallsPerimeter,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        externalWallsPerimeter: value,
                      ),
                    ),
                  ),
                ),
                RowCell(
                  initialValue: 'Ulkoseinien keskikorkeus (m)',
                ),
                InputCell(
                  initialValue: state.buildingFrame?.externalWallsAverageHeight,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        externalWallsAverageHeight: value,
                      ),
                    ),
                  ),
                ),
                EmptyCell(),
              ],
            ),
            // empty space between forms
            SizedBox(height: 32),
            LayoutGrid(
              columnSizes: [
                400.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
              ],
              rowSizes: [
                100.px,
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
                  checkbox: true,
                  checkboxTitle: 'Elementit ovat kierrätettäviä',
                  // TODO: fix overflow issues and enable longer text
                  // 'Liima-, betoni-, teräs- ja betonielementit ovat kierrätettäviä',
                  checkboxValue: state.buildingFrame?.areMaterialsRecyclable,
                  checkboxSetter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        areMaterialsRecyclable: value,
                      ),
                    ),
                  ),
                ),
                ColumnCell(
                  initialValue: 'Osuus (%)',
                ),
                ColumnCell(
                  initialValue: 'Osuus (m2)',
                ),
                ColumnCell(
                  initialValue: 'Puuta (m3)',
                ),
                ColumnCell(
                  initialValue: 'Puuta (tonnia)',
                ),
                ColumnCell(
                  initialValue: 'Betonia (m3)',
                ),
                ColumnCell(
                  initialValue: 'Betonia (tonnia)',
                ),
                ColumnCell(
                  initialValue: 'Terästä (tonnia)',
                ),
                ColumnCell(
                  initialValue: 'Tiiliä (m3)',
                ),
                ColumnCell(
                  initialValue: 'Tiiliä (tonnia)',
                ),
                RowCell(
                  initialValue: 'Puurunko',
                  iconButton: InfoButton(),
                ),

                // puurunko
                InputCell(
                  percentage: true,
                  initialValue: state.buildingFrame?.woodPortionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        woodPortionPercentage: value,
                      ),
                    ),
                  ),
                ),
                OutputCell(getter: () => state.woodFramePart.area),
                OutputCell(getter: () => state.woodFramePart.woodVolume),
                OutputCell(getter: () => state.woodFramePart.woodTons),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),

                // liimapalkit
                RowCell(
                  initialValue: 'Liimapalkit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  percentage: true,
                  initialValue: state
                      .buildingFrame?.glulamVerticalColumnsPortionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        glulamVerticalColumnsPortionPercentage: value,
                      ),
                    ),
                  ),
                ),
                OutputCell(getter: () => state.glulamBeamsPart.area),
                OutputCell(getter: () => state.glulamBeamsPart.woodVolume),
                OutputCell(getter: () => state.glulamBeamsPart.woodTons),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),

                // betonipalkit
                RowCell(
                  initialValue: 'Betonipalkit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  percentage: true,
                  initialValue: state
                      .buildingFrame?.concreteVerticalColumnsPortionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        concreteVerticalColumnsPortionPercentage: value,
                      ),
                    ),
                  ),
                ),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.woodTons,
                ),
                OutputCell(
                  getter: () =>
                      state.concreteVerticalColumnsPart.concreteVolume,
                ),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.concreteTons,
                ),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.steelTons,
                ),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.brickTons,
                ),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.brickVolume,
                ),

                // teräspalkit
                RowCell(
                  initialValue: 'Teräspalkit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  percentage: true,
                  initialValue: state
                      .buildingFrame?.steelVerticalColumnsPortionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        steelVerticalColumnsPortionPercentage: value,
                      ),
                    ),
                  ),
                ),
                OutputCell(getter: () => state.steelVerticalColumnsPart.area),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () => state.steelVerticalColumnsPart.steelTons,
                ),
                Cell.grey(),
                Cell.grey(),

                // kantavat tiiliseinät
                RowCell(
                  initialValue: 'Kantavat tiiliseinät',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  percentage: true,
                  initialValue: state.buildingFrame
                      ?.doubleLoadBearingBrickWallPortionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        doubleLoadBearingBrickWallPortionPercentage: value,
                      ),
                    ),
                  ),
                ),
                OutputCell(
                  getter: () => state.doubleLoadBearingBrickWallPart.area,
                ),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () =>
                      state.doubleLoadBearingBrickWallPart.brickVolume,
                ),
                OutputCell(
                  getter: () => state.doubleLoadBearingBrickWallPart.brickTons,
                ),

                // betonielementit
                RowCell(
                  initialValue: 'Betonielementit',
                  iconButton: InfoButton(),
                ),
                InputCell(
                  percentage: true,
                  initialValue: state.buildingFrame
                      ?.concreteElementWallsWithoutFrameworkPortionPercentage,
                  setter: (value) => totalBuildingFrameBloc.add(
                    BuildingFrameChanged(
                      state.buildingFrame!.copyWith(
                        concreteElementWallsWithoutFrameworkPortionPercentage:
                            value,
                      ),
                    ),
                  ),
                ),
                OutputCell(
                  getter: () =>
                      state.concreteElementWallsWithoutFrameworkPart.area,
                ),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () => state
                      .concreteElementWallsWithoutFrameworkPart.concreteVolume,
                ),
                OutputCell(
                  getter: () => state
                      .concreteElementWallsWithoutFrameworkPart.concreteTons,
                ),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),

                // yhteensä
                RowCell(
                  initialValue: 'Yhteensä',
                  iconButton: InfoButton(),
                ),
                OutputCell(
                  getter: () => state.totalEnvelopePartsPortionPercentage,
                ),
                OutputCell(getter: () => state.totalEnvelopePartsArea),
                OutputCell(getter: () => state.woodVolume),
                OutputCell(getter: () => state.woodTons),
                OutputCell(getter: () => state.concreteVolume),
                OutputCell(getter: () => state.concreteTons),
                OutputCell(getter: () => state.steelTons),
                OutputCell(getter: () => state.brickVolume),
                OutputCell(getter: () => state.brickTons),
              ],
            ),
          ],
        );
      },
    );
  }
}
