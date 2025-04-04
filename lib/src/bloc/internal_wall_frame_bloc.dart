import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';
import 'internal_wall_frame_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class InternalWallFrameBloc extends Bloc<InternalWallFrameEvent, InternalWallFrameState> {
  InternalWallFrameBloc() : super(InternalWallFrameState.initial()) {
    on<OverallWallLengthChanged>(_onOverallWallLengthChanged);
    on<AverageWallHeightChanged>(_onAverageWallHeightChanged);
    on<OfficeSpacesChanged>(_onOfficeSpacesChanged);
    on<LobbiesAnsOtherCommonAreasChanged>(_onLobbiesChanged);
    on<RestroomsAndWashingFacilitiesChanged>(_onRestroomsChanged);
    on<KitchensChanged>(_onKitchensChanged);
    on<TeachingAndTreatmentSpacesChanged>(_onTeachingChanged);
    on<StorageAndWorkSpacesChanged>(_onStorageChanged);
    on<OtherSpacesChanged>(_onOtherSpacesChanged);
    on<SurfaceMaterialCoatingContainsAsbestosChanged>(_onAsbestosChanged);
  }

  void _onOverallWallLengthChanged(
    OverallWallLengthChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(overallWallLength: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onAverageWallHeightChanged(
    AverageWallHeightChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(averageWallHeight: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onOfficeSpacesChanged(
    OfficeSpacesChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(officeSpaces: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onLobbiesChanged(
    LobbiesAnsOtherCommonAreasChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(lobbiesAndOtherCommonAreas: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onRestroomsChanged(
    RestroomsAndWashingFacilitiesChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(restroomsAndWashingFacilities: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onKitchensChanged(
    KitchensChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(kitchens: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onTeachingChanged(
    TeachingAndTreatmentSpacesChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(teachingAndTreatmentSpaces: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onStorageChanged(
    StorageAndWorkSpacesChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(storageAndWorkspaces: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onOtherSpacesChanged(
    OtherSpacesChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(otherSpaces: event.value);
    emit(state.copyWith(internalWallFrame: updated));
  }

  void _onAsbestosChanged(
    SurfaceMaterialCoatingContainsAsbestosChanged event,
    Emitter<InternalWallFrameState> emit,
  ) {
    final updated = state.internalWallFrame.copyWith(
      surfaceMaterialCoatingContainsAsbestos: event.value,
    );
    emit(state.copyWith(internalWallFrame: updated));
  }
}

class InternalWallFrameState{
  final InternalWallFramesAndSurfaceMaterial internalWallFrame;

  const InternalWallFrameState({required this.internalWallFrame});

  factory InternalWallFrameState.initial() {
    return InternalWallFrameState(
      internalWallFrame: InternalWallFramesAndSurfaceMaterial(),
    );
  }

  InternalWallFrameState copyWith({
    InternalWallFramesAndSurfaceMaterial? internalWallFrame,
  }) {
    return InternalWallFrameState(
      internalWallFrame: internalWallFrame ?? this.internalWallFrame,
    );
  }

  @override
  List<Object?> get props => [internalWallFrame];
}