import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class RoomSpaceForm extends StatelessWidget {
  const RoomSpaceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final internalWallFramesAndSurfaceMaterialBloc =
        context.read<RoomSpaceBloc>();

    return BlocBuilder<RoomSpaceBloc,
        InternalWallFramesAndSurfaceMaterial>(builder: (context, state) {
      return Column(
        children: [
          FormHeader(
            text: 'Erilaiset tilat kuten toimistot, aulat, luokkahuoneet, asuintilat ja muut vastaavat huoneet',
          ),
          LayoutGrid(
            columnSizes: [
              400.px,
              120.px,
            ],
            rowSizes: [50.px, 50.px, 50.px],
            children: [
              Cell(
                  type: CellType.row,
                  initialValue:
                      'Väliseinien runkorakenteet'
                      ),
              
            ],
          ),
        ],
      );
    });
  }
}
