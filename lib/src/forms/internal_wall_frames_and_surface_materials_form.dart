import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_app/src/data/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_event.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class InternalWallFramesAndSurfaceMaterialsForm extends StatelessWidget {
  const InternalWallFramesAndSurfaceMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final internalWallFramesAndSurfaceMaterialBloc =
        context.read<InternalWallFramesAndSurfaceMaterialBloc>();

    return BlocBuilder<InternalWallFramesAndSurfaceMaterialBloc,
        InternalWallFramesAndSurfaceMaterial>(builder: (context, state) {
      return Column(
        children: [
          FormHeader(
            text: 'Sisäseinien rungot ja pintamateriaalit',
          ),
          LayoutGrid(
            columnSizes: [
              400.px,
              120.px,
            ],
            rowSizes: [50.px, 50.px, 50.px],
            children: [
              RowCell(
                  initialValue:
                      'Sisäseinien kokonaispituus, kaikki kerrokset (jm)'),
              InputCell(
                initialValue: state.overallLengthOfInternalWallsAllFloors,
                setter: (value) => internalWallFramesAndSurfaceMaterialBloc.add(
                  OverallLengthOfInternalWallsAllFloorsChanged(value),
                ),
              ),
              RowCell(initialValue: 'Sisäseinien keskikorkeus (m)'),
              InputCell(
                initialValue: state.averageHeightOfInternalWalls,
                setter: (value) => internalWallFramesAndSurfaceMaterialBloc.add(
                  AverageHeightOfInternalWallsChanged(value),
                ),
              ),
              RowCell(initialValue: 'Sisäseinien kokonaispinta-ala (m2)'),
              OutputCell(
                getter: () => state.totalArea,
              ),
            ],
          ),
        ],
      );
    });
  }
}
