import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/door_bloc.dart';
import 'package:flutter_app/src/bloc/door_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/grey_cell.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class IndoorOutdoorForm extends StatelessWidget {
  const IndoorOutdoorForm({super.key});

  @override
  Widget build(BuildContext context) {
    final doorBloc = context.read<DoorBloc>();

    return BlocBuilder<DoorBloc, DoorsState>(builder: (context, state) {
      return Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeader(text: 'Ovien määrät'),
              LayoutGrid(
                columnSizes: [350.px, 100.px, 100.px, 100.px],
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
                  RowCell(
                    initialValue: "Ulko-ovet",
                    checkbox: true,
                    checkboxValue: state.outerDoors.areDoorsRecyclable,
                    checkboxTitle: "Ulko-ovet ovat kierrätyskelpoisia",
                    checkboxSetter: (value) => doorBloc.add(
                      OuterDoorRecyclableChanged(value),
                    ),
                  ),
                  ColumnCell(initialValue: "Puuovet (kpl)"),
                  ColumnCell(initialValue: "Alumiiniovet (kpl)"),
                  ColumnCell(initialValue: "Teräsovet (kpl)"),
                  RowCell(initialValue: "Umpiovia"),
                  InputCell(
                    initialValue: state.outerDoors.woodenDoors?.shutDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(OuterDoorWoodenShutDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.outerDoors.aluminiumDoors?.shutDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(OuterDoorAluminiumShutDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.outerDoors.steelDoors?.shutDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(OuterDoorSteelShutDoorsChanged(value)),
                  ),
                  RowCell(initialValue: "Lasiovia"),
                  InputCell(
                    initialValue: state.outerDoors.woodenDoors?.glassDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(OuterDoorWoodenGlassDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.outerDoors.aluminiumDoors?.glassDoors,
                    integer: true,
                    setter: (value) => doorBloc
                        .add(OuterDoorAluminiumGlassDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.outerDoors.steelDoors?.glassDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(OuterDoorSteelGlassDoorsChanged(value)),
                  ),
                  RowCell(initialValue: "Yhteensä (kpl)"),
                  OutputCell(
                      integer: true,
                      getter: () => state.outerDoors.woodenDoors?.doorCount),
                  OutputCell(
                      integer: true,
                      getter: () => state.outerDoors.aluminiumDoors?.doorCount),
                  OutputCell(
                      integer: true,
                      getter: () => state.outerDoors.steelDoors?.doorCount),
                  RowCell(initialValue: "Kulku- ja kuormausovet, teräs (kpl)"),
                  InputCell(
                    initialValue: state.outerDoors.accessAndLoadingDoors,
                    integer: true,
                    setter: (value) => doorBloc
                        .add(OuterDoorAccessAndLoadingDoorsChanged(value)),
                  ),
                  EmptyCell(),
                  EmptyCell(),
                  Cell.header(
                      initialValue: "Ulko-ovien materiaalimäärät yhteensä"),
                  ColumnCell(initialValue: "m3"),
                  ColumnCell(initialValue: "tonnia"),
                  EmptyCell(),
                  RowCell(initialValue: "Puu"),
                  OutputCell(getter: () => state.outerDoors.totalWoodVolume),
                  OutputCell(getter: () => state.outerDoors.totalWoodTons),
                  EmptyCell(),
                  RowCell(initialValue: "Lasi"),
                  OutputCell(getter: () => state.outerDoors.totalGlassVolume),
                  OutputCell(getter: () => state.outerDoors.totalGlassTons),
                  EmptyCell(),
                  RowCell(initialValue: "Teräs"),
                  GreyCell(),
                  OutputCell(getter: () => state.outerDoors.totalSteelTons),
                  EmptyCell(),
                  RowCell(initialValue: "Alumiini"),
                  GreyCell(),
                  OutputCell(getter: () => state.outerDoors.totalAluminiumTons),
                ],
              ),
              SizedBox(height: 30),
              LayoutGrid(
                columnSizes: [350.px, 100.px, 100.px, 100.px],
                rowSizes: [
                  50.px,
                  50.px,
                  50.px,
                  50.px,
                  50.px,
                  50.px,
                  50.px,
                  50.px,
                  50.px
                ],
                children: [
                  RowCell(
                    initialValue: "Sisäovet",
                    checkbox: true,
                    checkboxValue: state.innerDoors.areDoorsRecyclable,
                    checkboxTitle: "Sisäovet ovat kierrätyskelpoisia",
                    checkboxSetter: (value) => doorBloc.add(
                      InnerDoorRecyclableChanged(value),
                    ),
                  ),
                  ColumnCell(initialValue: "Levyovet (kpl)"),
                  ColumnCell(initialValue: "Puuovet (kpl)"),
                  ColumnCell(initialValue: "Palo-ovet (kpl)"),
                  RowCell(initialValue: "Umpiovia"),
                  InputCell(
                    initialValue: state.innerDoors.panelDoors?.shutDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(InnerDoorPanelShutDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.innerDoors.woodenDoors?.shutDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(InnerDoorWoodenShutDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.innerDoors.fireDoors?.shutDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(InnerDoorFireShutDoorsChanged(value)),
                  ),
                  RowCell(initialValue: "Lasiovia"),
                  InputCell(
                    initialValue: state.innerDoors.panelDoors?.glassDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(InnerDoorPanelGlassDoorsChanged(value)),
                  ),
                  InputCell(
                    initialValue: state.innerDoors.woodenDoors?.glassDoors,
                    integer: true,
                    setter: (value) =>
                        doorBloc.add(InnerDoorWoodenGlassDoorsChanged(value)),
                  ),
                  EmptyCell(),
                  RowCell(initialValue: "Yhteensä (kpl)"),
                  OutputCell(
                      integer: true,
                      getter: () => state.innerDoors.panelDoors?.doorCount),
                  OutputCell(
                      integer: true,
                      getter: () => state.innerDoors.woodenDoors?.doorCount),
                  EmptyCell(),
                  Cell.header(
                      initialValue: "Sisäovien materiaalimäärät yhteensä"),
                  ColumnCell(initialValue: "m3"),
                  ColumnCell(initialValue: "tonnia"),
                  EmptyCell(),
                  RowCell(initialValue: "Puu"),
                  OutputCell(getter: () => state.innerDoors.totalWoodVolume),
                  OutputCell(getter: () => state.innerDoors.totalWoodTons),
                  EmptyCell(),
                  RowCell(initialValue: "Lasi"),
                  OutputCell(getter: () => state.innerDoors.totalGlassVolume),
                  OutputCell(getter: () => state.innerDoors.totalGlassTons),
                  EmptyCell(),
                  RowCell(initialValue: "Teräs"),
                  GreyCell(),
                  OutputCell(getter: () => state.innerDoors.totalSteelTons),
                  EmptyCell(),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
