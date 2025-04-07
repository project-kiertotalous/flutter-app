import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/total_room_space_event.dart';
import 'package:flutter_app/src/bloc/room_space_bloc.dart';
import 'package:flutter_app/src/bloc/internal_wall_frames_and_surface_material_bloc.dart';

class TotalRoomSpaceBloc extends Bloc<TotalRoomSpaceEvent, TotalRoomSpace> {
  final RoomSpaceBloc roomSpaceBloc;
  final InternalWallFramesAndSurfaceMaterialBloc
      internalWallFramesAndSurfaceMaterialBloc;

  TotalRoomSpaceBloc(
    this.internalWallFramesAndSurfaceMaterialBloc,
    this.roomSpaceBloc,
  ) : super(TotalRoomSpace().copyWith(
            internalWallFramesAndSurfaceMaterial:
                internalWallFramesAndSurfaceMaterialBloc.state,
            roomSpace: roomSpaceBloc.state)) {
    on<InternalWallFramesAndSurfaceMaterialChanged>((event, emit) {
      logger.d(
          "InternalWallFramesAndSurfaceMaterial changed to ${event.value}");
      emit(state.copyWith(
          internalWallFramesAndSurfaceMaterial:
              event.value));
    });

    internalWallFramesAndSurfaceMaterialBloc.stream
        .listen((internalWallFramesAndSurfaceMaterialState) {
      logger.d(
          'Received update from InternalWallFramesAndSurfaceMaterialBloc: $internalWallFramesAndSurfaceMaterialState');
      add(InternalWallFramesAndSurfaceMaterialChanged(
          internalWallFramesAndSurfaceMaterialState));
    });
  }
}
