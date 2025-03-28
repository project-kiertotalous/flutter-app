import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';  // Make sure this import exists
import 'room_space_event.dart';

class RoomSpaceBloc extends Bloc<RoomSpaceEvent, RoomSpaces> {
  RoomSpaceBloc() : super(RoomSpaces(
    officeSpaces: RoomSpace(),
    lobbiesAndOtherCommonAreas: RoomSpace(),
    restroomsAndWashingFacilities: RoomSpace(),
    kitchens: RoomSpace(),
    teachingAndTreatmentSpaces: RoomSpace(),
    storageAndWorkspaces: RoomSpace(),
    otherSpaces: RoomSpace(),
  )) {
    on<OfficeSpaceChanged>((event, emit) {
      logger.d("OfficeSpaceChanged to ${event.officeSpace}");
      emit(state.copyWith(officeSpaces: event.officeSpace));
    });
    
    on<LobbiesChanged>((event, emit) {
      logger.d("LobbiesChanged to ${event.lobbies}");
      emit(state.copyWith(lobbiesAndOtherCommonAreas: event.lobbies));
    });
    
    on<RestroomsChanged>((event, emit) {
      logger.d("RestroomsChanged to ${event.restrooms}");
      emit(state.copyWith(restroomsAndWashingFacilities: event.restrooms));
    });
    
    on<KitchensChanged>((event, emit) {
      logger.d("KitchensChanged to ${event.kitchens}");
      emit(state.copyWith(kitchens: event.kitchens));
    });
    
    on<TeachingSpacesChanged>((event, emit) {
      logger.d("TeachingSpacesChanged to ${event.teachingSpaces}");
      emit(state.copyWith(teachingAndTreatmentSpaces: event.teachingSpaces));
    });
    
    on<StorageChanged>((event, emit) {
      logger.d("StorageChanged to ${event.storage}");
      emit(state.copyWith(storageAndWorkspaces: event.storage));
    });
    
    on<OtherSpacesChanged>((event, emit) {
      logger.d("OtherSpacesChanged to ${event.otherSpaces}");
      emit(state.copyWith(otherSpaces: event.otherSpaces));
    });
    
    on<SurfaceMaterialCoatingChanged>((event, emit) {
      logger.d("SurfaceMaterialCoatingChanged to ${event.containsAsbestos}");
      emit(state.copyWith(
        surfaceMaterialCoatingContainsAsbestos: event.containsAsbestos
      ));
    });
  }
}