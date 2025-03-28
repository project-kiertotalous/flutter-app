import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internal_wall_frames_and_surface_material_event.dart';
import 'package:flutter_app/log.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/partition_walls_demolition_materials.dart';

class InternalWallFramesAndSurfaceMaterialBloc extends Bloc<
    InternalWallFramesAndSurfaceMaterialEvent,
    InternalWallFramesAndSurfaceMaterial> {
  InternalWallFramesAndSurfaceMaterialBloc()
      : super(InternalWallFramesAndSurfaceMaterial()) {
    on<OverallLengthOfInternalWallsAllFloorsChanged>((event, emit) {
      logger
          .d("OverallLengthOfInternalWallsAllFloorsChanged to ${event.amount}");
      emit(state.copyWith(
        overallLengthOfInternalWallsAllFloors: event.amount,
      ));
    });

    on<AverageHeightOfInternalWallsChanged>((event, emit) {
      logger.d("AverageHeightOfInternalWallsChanged to ${event.amount}");
      emit(state.copyWith(
        averageHeightOfInternalWalls: event.amount,
      ));
    });
  }
}
