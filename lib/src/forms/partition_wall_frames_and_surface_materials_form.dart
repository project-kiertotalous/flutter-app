import 'package:flutter/material.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_event.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class PartitionWallFramesAndSurfaceMaterialsForm extends StatelessWidget {
  const PartitionWallFramesAndSurfaceMaterialsForm({super.key});

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
              Cell(
                  type: CellType.row,
                  initialValue:
                      'Sisäseinien kokonaispituus, kaikki kerrokset (jm)'),
              Cell(
                type: CellType.input,
                initialValue: state.overallLengthOfInternalWallsAllFloors,
                setter: (value) => internalWallFramesAndSurfaceMaterialBloc.add(
                  OverallLengthOfInternalWallsAllFloorsChanged(value),
                ),
              ),
              Cell(
                  type: CellType.row,
                  initialValue: 'Sisäseinien keskikorkeus (m)'),
              Cell(
                type: CellType.input,
                initialValue: state.averageHeightOfInternalWalls,
                setter: (value) => internalWallFramesAndSurfaceMaterialBloc.add(
                  AverageHeightOfInternalWallsChanged(value),
                ),
              ),
              Cell(
                  type: CellType.row,
                  initialValue: 'Sisäseinien kokonaispinta-ala (m2)'),
              Cell(
                type: CellType.output,
                initialValue: state.totalArea,
              ),
            ],
          ),
        ],
      );
    });
  }
}
