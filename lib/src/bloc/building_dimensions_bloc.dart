import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/building_dimensions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingDimensionsBloc
    extends Bloc<BuildingDimensionsEvent, BuildingDimensions> {
  BuildingDimensionsBloc() : super(BuildingDimensions()) {
    on<GrossFloorAreaChanged>((event, emit) {
      logger.d("BuildingDimensions.grossFloorArea changed to ${event.value}");
      emit(
        state.copyWith(grossFloorArea: event.value),
      );
    });
    on<VolumeChanged>((event, emit) {
      logger.d("BuildingDimensions.volume changed to ${event.value}");
      emit(
        state.copyWith(volume: event.value),
      );
    });
    on<FloorCountExcludingCellarsChanged>((event, emit) {
      logger.d(
          "BuildingDimensions.floorCountExcludingCellars changed to ${event.value}");
      emit(
        state.copyWith(floorCountExcludingCellars: event.value),
      );
    });
    on<AverageAreaChanged>((event, emit) {
      logger.d("BuildingDimensions.averageArea changed to ${event.value}");
      emit(
        state.copyWith(averageArea: event.value),
      );
    });
  }
}
