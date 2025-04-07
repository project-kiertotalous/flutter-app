import 'package:bl_demolition_materials/bl_demolition_materials.dart';
abstract class TotalRoomSpaceEvent {}

class InternalWallFramesAndSurfaceMaterialChanged
    extends TotalRoomSpaceEvent {
  final InternalWallFramesAndSurfaceMaterial value;
  InternalWallFramesAndSurfaceMaterialChanged(this.value);
}



