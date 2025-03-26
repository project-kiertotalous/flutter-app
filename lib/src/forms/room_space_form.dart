import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/room_space_bloc.dart';
import 'package:flutter_app/src/bloc/room_space_event.dart';
import 'package:flutter_app/src/data/column_cell.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class RoomSpaceForm extends StatelessWidget {
  const RoomSpaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final roomSpaceBloc = context.read<RoomSpaceBloc>();

    return BlocBuilder<RoomSpaceBloc, RoomSpaces>(builder: (context, state) {
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
                340.px,
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
                120.px,
              ],
              rowSizes: [50.px, 50.px, 50.px, 50.px, 50.px, 50.px, 50.px],
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
                  initialValue: state.officeSpaces?.woodFramedWallsLinearMeters,
                  setter: (value) {
                    final parsedValue = num.tryParse(value) ?? 0;
                    context.read<RoomSpaceBloc>().add(OfficeSpaceChanged(
                        (state.officeSpaces ?? RoomSpace()).copyWith(
                            woodFramedWallsLinearMeters: parsedValue)));
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
