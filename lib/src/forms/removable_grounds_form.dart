import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/bloc/excavation_area_event.dart';
import 'package:flutter_app/src/data/cell.dart';
import 'package:flutter_app/src/data/cell_type.dart';
import 'package:flutter_app/src/data/form_header.dart';
import 'package:flutter_app/src/data/output_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RemovableGroundsForm extends StatelessWidget {
  const RemovableGroundsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final excavationAreaBloc = context.read<ExcavationAreaBloc>();

    return BlocBuilder<ExcavationAreaBloc, ExcavationArea>(
        builder: (context, state) {
      return Column(
        children: [
          FormHeader(
              text: 'Poistettavat maa-ainekset, poistettava alue ja määrä'),
          LayoutGrid(
            columnSizes: [
              400.px,
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
              50.px,
            ],
            children: [
              Cell(
                type: CellType.row,
                initialValue: 'Poistettavan alueen pinta-ala (m2)',
              ),
              Cell(
                type: CellType.input,
                initialValue: state.areaToRemoveSize,
                setter: (value) => excavationAreaBloc.add(
                  AreaToRemoveSizeChanged(value),
                ),
              ),
              Cell(
                  type: CellType.row,
                  initialValue: 'Poistettavan alueen syvyys (m)'),
              Cell(
                type: CellType.input,
                initialValue: state.areaToRemoveDepth,
                setter: (value) => excavationAreaBloc.add(
                  AreaToRemoveDepthChanged(value),
                ),
              ),
              Cell(type: CellType.row, initialValue: 'Poistettava määrä (m3)'),
              OutputCell(getter: () => state.volumeToRemove),
              Cell(
                  type: CellType.row,
                  initialValue: 'Poistettavan puhtaan maan osuus (%)'),
              OutputCell(
                  getter: () => state.cleanSoilPortionPercentageFraction),
              Cell(type: CellType.row, initialValue: 'Puhdas maa (tonnia)'),
              OutputCell(getter: () => state.cleanLandTons),
              Cell(type: CellType.row, initialValue: 'Saastunut maa (tonnia)'),
              OutputCell(getter: () => state.contaminatedLandTons),
              Cell(type: CellType.row, initialValue: 'Saastunut maa (m3)'),
              OutputCell(getter: () => state.contaminatedSoil),
              Cell(type: CellType.row, initialValue: 'Asfaltti alue (m2)'),
              Cell(
                type: CellType.input,
                initialValue: state.asphaltArea,
                setter: (value) => excavationAreaBloc.add(
                  AsphaltAreaChanged(value),
                ),
              ),
              Cell(type: CellType.row, initialValue: 'Asfaltti (tonnia)'),
              OutputCell(getter: () => state.asphaltTons),
              Cell(type: CellType.row, initialValue: 'Asfaltti (m3)'),
              OutputCell(getter: () => state.asphaltVolume),
            ],
          ),
        ],
      );
    });
  }
}
