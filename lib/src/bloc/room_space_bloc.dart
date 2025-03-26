import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<OfficeSpaceChanged>((event, emit) => emit(state.copyWith(officeSpaces: event.officeSpace)));
    on<LobbiesChanged>((event, emit) => emit(state.copyWith(lobbiesAndOtherCommonAreas: event.lobbies)));
    on<RestroomsChanged>((event, emit) => emit(state.copyWith(restroomsAndWashingFacilities: event.restrooms)));
    on<KitchensChanged>((event, emit) => emit(state.copyWith(kitchens: event.kitchens)));
    on<TeachingSpacesChanged>((event, emit) => emit(state.copyWith(teachingAndTreatmentSpaces: event.teachingSpaces)));
    on<StorageChanged>((event, emit) => emit(state.copyWith(storageAndWorkspaces: event.storage)));
    on<OtherSpacesChanged>((event, emit) => emit(state.copyWith(otherSpaces: event.otherSpaces)));
    on<SurfaceMaterialCoatingChanged>((event, emit) => emit(state.copyWith(surfaceMaterialCoatingContainsAsbestos: event.containsAsbestos)));
  }
}