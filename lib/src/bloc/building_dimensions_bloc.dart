import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/building_dimensions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingDimensionsBloc
    extends Bloc<BuildingDimensionsEvent, BuildingDimensions> {
  BuildingDimensionsBloc() : super(BuildingDimensions()) {
    // materials
    on<GrossFloorAreaChanged>((event, emit) {
      logger.d("GrossFloorAreaChanged ${event.value}");
      emit(
        state.copyWith(
          grossFloorArea: event.value,
        ),
      );
    });
    on<VolumeChanged>((event, emit) {
      logger.d("VolumeChanged ${event.value}");
      emit(
        state.copyWith(
          volume: event.value,
        ),
      );
    });
    on<FloorCountExcludingCellarsChanged>((event, emit) {
      logger.d("FloorCountExcludingCellarsChanged ${event.value}");
      emit(
        state.copyWith(
          floorCountExcludingCellars: event.value,
        ),
      );
    });
    on<AverageAreaChanged>((event, emit) {
      logger.d("AverageAreaChanged ${event.value}");
      emit(
        state.copyWith(
          averageArea: event.value,
        ),
      );
    });
  }
}
