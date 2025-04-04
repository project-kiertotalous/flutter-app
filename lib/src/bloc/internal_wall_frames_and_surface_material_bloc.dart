import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internal_wall_frames_and_surface_material_event.dart';
import 'package:flutter_app/src/bloc/room_space_bloc.dart';
import 'package:flutter_app/log.dart';

class InternalWallFramesAndSurfaceMaterialBloc extends Bloc<
    InternalWallFramesAndSurfaceMaterialEvent,
    InternalWallFramesAndSurfaceMaterial> {
      final RoomSpaceBloc roomSpaceBloc = RoomSpaceBloc();

      
  InternalWallFramesAndSurfaceMaterialBloc()
      : super(InternalWallFramesAndSurfaceMaterial()) {
    on<OverallLengthOfInternalWallsAllFloorsChanged>((event, emit) {
      logger
          .d("OverallLengthOfInternalWallsAllFloorsChanged to ${event.amount}");
      emit(state.copyWith(
        overallWallLength: event.amount,
      ));
    });

    on<AverageHeightOfInternalWallsChanged>((event, emit) {
      logger.d("AverageHeightOfInternalWallsChanged to ${event.amount}");
      emit(state.copyWith(
        averageWallHeight: event.amount,
      ));
    });

on<OfficeSpacesChanged>((event, emit) {
      logger.d("OfficeSpacesChanged to ${event.officeSpaces}");
      emit(state.copyWith(
        officeSpaces: event.officeSpaces,
      ));
    });
on<LobbiesAndOtherCommonAreasChanged>((event, emit) {
      logger.d("LobbiesAndOtherCommonAreasChanged to ${event.lobbiesAndOtherCommonAreas}");
      emit(state.copyWith(
        lobbiesAndOtherCommonAreas: event.lobbiesAndOtherCommonAreas,
      ));
    });

    on<RestroomsAndWashingFacilitiesChanged>((event, emit) {
      logger.d("RestroomsAndWashingFacilitiesChanged to ${event.restroomsAndWashingFacilities}");
      emit(state.copyWith(
        restroomsAndWashingFacilities: event.restroomsAndWashingFacilities,
      ));
    });

    on<KitchensChanged>((event, emit) {
      logger.d("KitchensChanged to ${event.kitchens}");
      emit(state.copyWith(
        kitchens: event.kitchens,
      ));
    });

    on<TeachingAndTreatmentSpacesChanged>((event, emit) {
      logger.d("TeachingAndTreatmentSpacesChanged to ${event.teachingAndTreatmentSpaces}");
      emit(state.copyWith(
        teachingAndTreatmentSpaces: event.teachingAndTreatmentSpaces,
      ));
    });

    on<StorageAndWorkSpacesChanged>((event, emit) {
      logger.d("StorageAndWorkSpacesChanged to ${event.storageAndWorkSpaces}");
      emit(state.copyWith(
        storageAndWorkspaces: event.storageAndWorkSpaces,
      ));
    });

    on<OtherSpacesChanged>((event, emit) {
      logger.d("OtherSpacesChanged to ${event.otherSpaces}");
      emit(state.copyWith(
        otherSpaces: event.otherSpaces,
      ));
    });

    roomSpaceBloc.stream.listen((roomSpaceState) {
      logger.d("RoomSpaceBloc stream updated");
      add(RoomSpaceChanged(roomSpaceState));
    });
  }
}
