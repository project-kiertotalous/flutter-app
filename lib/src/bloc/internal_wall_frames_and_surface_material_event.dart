import 'package:bl_demolition_materials/bl_demolition_materials.dart';


abstract class InternalWallFramesAndSurfaceMaterialEvent {}

class OverallLengthOfInternalWallsAllFloorsChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final num amount;
  OverallLengthOfInternalWallsAllFloorsChanged(this.amount);
}

class AverageHeightOfInternalWallsChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final num amount;
  AverageHeightOfInternalWallsChanged(this.amount);
}

class RoomSpaceChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace roomSpace;
  RoomSpaceChanged(this.roomSpace);
}

class OfficeSpacesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace officeSpaces;
  OfficeSpacesChanged(this.officeSpaces);
}

class LobbiesAndOtherCommonAreasChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace lobbiesAndOtherCommonAreas;
  LobbiesAndOtherCommonAreasChanged(this.lobbiesAndOtherCommonAreas);
}

class RestroomsAndWashingFacilitiesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace restroomsAndWashingFacilities;
  RestroomsAndWashingFacilitiesChanged(this.restroomsAndWashingFacilities);
}

class KitchensChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace kitchens;
  KitchensChanged(this.kitchens);
}

class TeachingAndTreatmentSpacesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace teachingAndTreatmentSpaces;
  TeachingAndTreatmentSpacesChanged(this.teachingAndTreatmentSpaces);
}

class StorageAndWorkSpacesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace storageAndWorkSpaces;
  StorageAndWorkSpacesChanged(this.storageAndWorkSpaces);
}
 
class OtherSpacesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace otherSpaces;
  OtherSpacesChanged(this.otherSpaces);
}

class SurfaceMaterialCoatingContainsAsbestosChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final bool containsAsbestos;
  SurfaceMaterialCoatingContainsAsbestosChanged(this.containsAsbestos);
}
