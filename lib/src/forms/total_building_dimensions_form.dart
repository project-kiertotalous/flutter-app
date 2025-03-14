import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/input_cell.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class TotalBuildingDimensionsForm extends StatelessWidget {
  const TotalBuildingDimensionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final totalBuildingDimensionsBloc =
        context.read<TotalBuildingDimensionsBloc>();

    return BlocBuilder<TotalBuildingDimensionsBloc, TotalBuildingDimensions>(
        builder: (context, state) {
      return LayoutGrid(
        columnSizes: [
          400.px,
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
        ],
        children: [
          Cell(
            type: CellType.empty,
            initialValue: 'Poistettavan alueen pinta-ala (m2)',
          ),
          Cell(
            type: CellType.column,
            initialValue: 'Todellinen pinta-ala (m2)',
          ),
          Cell(
              type: CellType.column,
              initialValue: 'Laskennallinen pinta-ala (m2)'),
          Cell(
            type: CellType.row,
            initialValue: 'Rakennuksen kerrospinta-ala (bruttoala) (m2)',
          ),
          InputCell(
            initialValue: state.buildingDimensions?.grossFloorArea,
            setter: (value) => totalBuildingDimensionsBloc.add(
              GrossFloorAreaChanged(value),
            ),
          ),
          OutputCell(
            // TODO: maybe incorrect getter
            getter: () => state.calculatedGrossFloorArea,
          ),
          Cell(
            type: CellType.row,
            initialValue: 'Rakennuksen tilavuus (m3)',
          ),
          InputCell(
            initialValue: state.buildingDimensions?.volume,
            setter: (value) => totalBuildingDimensionsBloc.add(
              VolumeChanged(value),
            ),
          ),
          OutputCell(
            getter: () => state.calculatedVolume,
          ),
          Cell(
            type: CellType.row,
            initialValue: 'Kerrosten määrä, ilman kellaritiloja',
          ),
          InputCell(
            initialValue: state.buildingDimensions?.floorCountExcludingCellars,
            setter: (value) => totalBuildingDimensionsBloc.add(
              FloorCountExcludingCellarsChanged(value),
            ),
            integer: true,
          ),
          OutputCell(
            getter: () => state.floorCountExcludingBasements,
          ),
          Cell(
            type: CellType.row,
            initialValue: 'Keskimääräinen pinta-ala (m2)',
          ),
          InputCell(
            initialValue: state.buildingDimensions?.averageArea,
            setter: (value) => totalBuildingDimensionsBloc.add(
              AverageAreaChanged(value),
            ),
          ),
          OutputCell(
            getter: () => state.averageArea,
          ),
          Cell(
            type: CellType.row,
            initialValue: 'Kerrospinta-ala yhteensä (ei kellaritiloja) (m2)',
          ),
          OutputCell(
            getter: () => state.grossFloorAreaExcludingCellars,
          ),
          OutputCell(
            // TODO: maybe incorrect getter
            getter: () => state.calculatedAreaPerFloor,
          ),
        ],
      );
    });
  }
}
