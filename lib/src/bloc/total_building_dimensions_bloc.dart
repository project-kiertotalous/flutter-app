import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBuildingDimensionsBloc
    extends Bloc<TotalBuildingDimensionsEvent, TotalBuildingDimensions> {
  TotalBuildingDimensionsBloc() : super(TotalBuildingDimensions()) {
    // materials
    on<GrossFloorAreaChanged>((event, emit) {
      logger.d("GrossFloorAreaChanged ${event.value}");
      emit(
        state.copyWith(
          buildingDimensions: BuildingDimensions(
            grossFloorArea: event.value,
            volume: state.buildingDimensions?.volume,
            floorCountExcludingCellars:
                state.buildingDimensions?.floorCountExcludingCellars,
            averageArea: state.buildingDimensions?.averageArea,
          ),
        ),
      );
    });
    on<VolumeChanged>((event, emit) {
      logger.d("VolumeChanged ${event.value}");
      emit(
        state.copyWith(
          buildingDimensions: BuildingDimensions(
            grossFloorArea: state.buildingDimensions?.grossFloorArea,
            volume: event.value,
            floorCountExcludingCellars:
                state.buildingDimensions?.floorCountExcludingCellars,
            averageArea: state.buildingDimensions?.averageArea,
          ),
        ),
      );
    });
    on<FloorCountExcludingCellarsChanged>((event, emit) {
      logger.d("FloorCountExcludingCellarsChanged ${event.value}");
      emit(
        state.copyWith(
          buildingDimensions: BuildingDimensions(
            grossFloorArea: state.buildingDimensions?.grossFloorArea,
            volume: state.buildingDimensions?.volume,
            floorCountExcludingCellars: event.value,
            averageArea: state.buildingDimensions?.averageArea,
          ),
        ),
      );
    });
    on<AverageAreaChanged>((event, emit) {
      logger.d("AverageAreaChanged ${event.value}");
      emit(
        state.copyWith(
          buildingDimensions: BuildingDimensions(
            grossFloorArea: state.buildingDimensions?.grossFloorArea,
            volume: state.buildingDimensions?.volume,
            floorCountExcludingCellars:
                state.buildingDimensions?.floorCountExcludingCellars,
            averageArea: event.value,
          ),
        ),
      );
    });
  }
}
