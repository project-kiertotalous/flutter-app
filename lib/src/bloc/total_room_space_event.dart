import 'package:bl_demolition_materials/bl_demolition_materials.dart';
abstract class TotalRoomSpaceEvent {}

class InternalWallFramesAndSurfaceMaterialChanged
    extends TotalRoomSpaceEvent {
  final InternalWallFramesAndSurfaceMaterial internalWallFramesAndSurfaceMaterial;
  InternalWallFramesAndSurfaceMaterialChanged(this.internalWallFramesAndSurfaceMaterial);
}

class RoomSpaceChanged extends TotalRoomSpaceEvent {
  final RoomSpace roomSpace;
  RoomSpaceChanged(this.roomSpace);
}


