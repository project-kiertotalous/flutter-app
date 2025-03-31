import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/room_space.dart';

abstract class RoomSpaceEvent {}

class OfficeSpaceChanged extends RoomSpaceEvent {
  final RoomSpace officeSpace;
  OfficeSpaceChanged(this.officeSpace);
}

class LobbiesChanged extends RoomSpaceEvent {
  final RoomSpace lobbies;
  LobbiesChanged(this.lobbies);
}

class RestroomsChanged extends RoomSpaceEvent {
  final RoomSpace restrooms;
  RestroomsChanged(this.restrooms);
}

class KitchensChanged extends RoomSpaceEvent {
  final RoomSpace kitchens;
  KitchensChanged(this.kitchens);
}

class TeachingSpacesChanged extends RoomSpaceEvent {
  final RoomSpace teachingSpaces;
  TeachingSpacesChanged(this.teachingSpaces);
}

class StorageChanged extends RoomSpaceEvent {
  final RoomSpace storage;
  StorageChanged(this.storage);
}

class OtherSpacesChanged extends RoomSpaceEvent {
  final RoomSpace otherSpaces;
  OtherSpacesChanged(this.otherSpaces);
}

class SurfaceMaterialCoatingChanged extends RoomSpaceEvent {
  final bool containsAsbestos;
  SurfaceMaterialCoatingChanged(this.containsAsbestos);
}