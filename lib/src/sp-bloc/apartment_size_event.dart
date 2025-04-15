import 'package:bl_demolition_materials/bl_demolition_materials.dart';
abstract class SPApartmentSizeEvent {}

class OneRoomPcsPerHouseChanged extends SPApartmentSizeEvent {
  final num value;
  OneRoomPcsPerHouseChanged(this.value);
}

class TwoRoomsPcsPerHouseChanged extends SPApartmentSizeEvent {
  final num value;
  TwoRoomsPcsPerHouseChanged(this.value);
}

class ThreeRoomsPcsPerHouseChanged extends SPApartmentSizeEvent {
  final num value;
  ThreeRoomsPcsPerHouseChanged(this.value);
}
class FourRoomsPcsPerHouseChanged extends SPApartmentSizeEvent {
  final num value;
  FourRoomsPcsPerHouseChanged(this.value);
}

class OneRoomFloorAreaPerApartmentChanged extends SPApartmentSizeEvent {
  final num value;
  OneRoomFloorAreaPerApartmentChanged(this.value);
}
class TwoRoomsFloorAreaPerApartmentChanged extends SPApartmentSizeEvent {
  final num value;
  TwoRoomsFloorAreaPerApartmentChanged(this.value);
}
class ThreeRoomsFloorAreaPerApartmentChanged extends SPApartmentSizeEvent {
  final num value;
  ThreeRoomsFloorAreaPerApartmentChanged(this.value);
}

class FourRoomsFloorAreaPerApartmentChanged extends SPApartmentSizeEvent {
  final num value;
  FourRoomsFloorAreaPerApartmentChanged(this.value);
}

class OneRoomInnerWallsPerApartmentLinearMetersChanged extends SPApartmentSizeEvent {
  final num value;
  OneRoomInnerWallsPerApartmentLinearMetersChanged(this.value);
}

class TwoRoomsInnerWallsPerApartmentLinearMetersChanged extends SPApartmentSizeEvent {
  final num value;
  TwoRoomsInnerWallsPerApartmentLinearMetersChanged(this.value);
}

class ThreeRoomsInnerWallsPerApartmentLinearMetersChanged extends SPApartmentSizeEvent {
  final num value;
  ThreeRoomsInnerWallsPerApartmentLinearMetersChanged(this.value);
}

class FourRoomsInnerWallsPerApartmentLinearMetersChanged extends SPApartmentSizeEvent {
  final num value;
  FourRoomsInnerWallsPerApartmentLinearMetersChanged(this.value);
}

class OneRoomWallHeightChanged extends SPApartmentSizeEvent {
  final num value;
  OneRoomWallHeightChanged(this.value);
}

class TwoRoomsWallHeightChanged extends SPApartmentSizeEvent {
  final num value;
  TwoRoomsWallHeightChanged(this.value);
}

class ThreeRoomsWallHeightChanged extends SPApartmentSizeEvent {
  final num value;
  ThreeRoomsWallHeightChanged(this.value);
}

class FourRoomsWallHeightChanged extends SPApartmentSizeEvent {
  final num value;
  FourRoomsWallHeightChanged(this.value);
}

class SurfaceMaterialChanged extends SPApartmentSizeEvent {
  final SurfaceMaterial? surfaceMaterial;
  SurfaceMaterialChanged(this.surfaceMaterial);
}

class FloorMaterialChanged extends SPApartmentSizeEvent {
  final FloorMaterial? floorMaterial;
  FloorMaterialChanged(this.floorMaterial);
}
class KitchenWallMaterialChanged extends SPApartmentSizeEvent {
  final KitchenWallMaterial? kitchenWallMaterial;
  KitchenWallMaterialChanged(this.kitchenWallMaterial);
}

class OneRoomKitchenClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  OneRoomKitchenClosetsInLinearMeterChanged(this.value);
}
class TwoRoomsKitchenClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  TwoRoomsKitchenClosetsInLinearMeterChanged(this.value);
}
class ThreeRoomsKitchenClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  ThreeRoomsKitchenClosetsInLinearMeterChanged(this.value);
}
class FourRoomsKitchenClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  FourRoomsKitchenClosetsInLinearMeterChanged(this.value);
}
class AreKitchenClosetsRecyclableChanged extends SPApartmentSizeEvent {
  final bool areKitchenClosetsRecyclable;
  AreKitchenClosetsRecyclableChanged(this.areKitchenClosetsRecyclable);
}
class OneRoomDressingClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  OneRoomDressingClosetsInLinearMeterChanged(this.value);
}
class TwoRoomsDressingClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  TwoRoomsDressingClosetsInLinearMeterChanged(this.value);
}
class ThreeRoomsDressingClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  ThreeRoomsDressingClosetsInLinearMeterChanged(this.value);
}
class FourRoomsDressingClosetsInLinearMeterChanged extends SPApartmentSizeEvent {
  final num value;
  FourRoomsDressingClosetsInLinearMeterChanged(this.value);
}
class AreDressingClosetsRecyclableChanged extends SPApartmentSizeEvent {
  final bool areDressingClosetsRecyclable;
  AreDressingClosetsRecyclableChanged(this.areDressingClosetsRecyclable);
}





