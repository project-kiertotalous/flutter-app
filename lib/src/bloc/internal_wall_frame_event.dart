import 'package:equatable/equatable.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class InternalWallFrameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InternalWallFrameChanged extends InternalWallFrameEvent {
  final InternalWallFramesAndSurfaceMaterial internalWallFrame;
  InternalWallFrameChanged(this.internalWallFrame);

  @override
  List<Object?> get props => [internalWallFrame];
}

class OverallWallLengthChanged extends InternalWallFrameEvent {
  final double value;
  OverallWallLengthChanged(this.value);

  @override
  List<Object?> get props => [value];
}
class AverageWallHeightChanged extends InternalWallFrameEvent {
  final double value;
  AverageWallHeightChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class OfficeSpacesChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  OfficeSpacesChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class LobbiesAnsOtherCommonAreasChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  LobbiesAnsOtherCommonAreasChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class RestroomsAndWashingFacilitiesChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  RestroomsAndWashingFacilitiesChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class KitchensChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  KitchensChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class TeachingAndTreatmentSpacesChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  TeachingAndTreatmentSpacesChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class StorageAndWorkSpacesChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  StorageAndWorkSpacesChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class OtherSpacesChanged extends InternalWallFrameEvent {
  final RoomSpace value;
  OtherSpacesChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class SurfaceMaterialCoatingContainsAsbestosChanged
    extends InternalWallFrameEvent {
  final bool value;
  SurfaceMaterialCoatingContainsAsbestosChanged(this.value);

  @override
  List<Object?> get props => [value];
}

