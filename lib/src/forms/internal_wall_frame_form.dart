import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/internal_wall_frame_bloc.dart';import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/empty_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/grey_cell.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/room_space.dart';

class RoomSpaceForm extends StatelessWidget {
  const RoomSpaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final roomSpaceBloc = context.read<RoomSpaceBloc>();

    return BlocBuilder<RoomSpaceBloc, RoomSpaceState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            FormHeader(
              text:
                  'Erilaiset tilat kuten toimistot, aulat, luokkahuoneet, asuintilat ja muut vastaavat huoneet',
            ),
            LayoutGrid(
              columnSizes: [
                335.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                120.px,
                120.px,
                120.px,
              ],
              rowSizes: [
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
                  initialValue:
                      'Erilaiset tilat, kuten toimistot, aulat, luokkahuoneet, asuintilat ja muut vastaavat huoneet',
                ),
                ColumnCell(
                  initialValue: 'Toimistotilat',
                ),
                ColumnCell(
                  initialValue: 'Aulat ja muut yleiset tilat',
                ),
                ColumnCell(
                  initialValue: 'WC ja pesutilat',
                ),
                ColumnCell(
                  initialValue: 'Keittiöt',
                ),
                ColumnCell(
                  initialValue: 'Opetus-/hoitotilat (m2)',
                ),
                ColumnCell(
                  initialValue: 'Varastot ja työtilat',
                ),
                ColumnCell(
                  initialValue: 'Muut tilat',
                ),
                ColumnCell(
                  initialValue: 'Kaikki tilat yhteensä (m2)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (m3)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (t)',
                ),
                RowCell(
                  initialValue: 'Puurunkoiset seinät (jm)',
                ),
                InputCell(
                  initialValue: state.internalWallFrame?.officeSpaces?
                      .woodFramedWalls,
                  setter: (value) {
                    final current = state.internalWallFrame?.officeSpaces ?? RoomSpace();
                    roomSpaceBloc.add(OfficeSpacesChanged(
                      current.copyWith(woodFramedWalls: value),
                    ));
                  },
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                RowCell(
                  initialValue: 'Tiiliseinät (jm)',
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                RowCell(
                  initialValue: 'Betonielementti-/Valuseinät (jm)',
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                InputCell(
                  initialValue: 0,
                  setter: (value) {},
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                RowCell(
                  initialValue: 'Tilan seinäpituus yhteensä (jm)',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                GreyCell(),
                GreyCell(),
                RowCell(
                  initialValue: 'Tilan seinäpinta-ala yhteensä (m2)',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                OutputCell(
                  getter: () => '',
                ),
                GreyCell(),
                GreyCell(),
                RowCell(
                  initialValue: 'Tilan osuus seinien kokonaispinta-alasta (%)',
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                  percentage: true,
                ),
                OutputCell(
                  getter: () => '',
                ),
                GreyCell(),
                GreyCell(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
