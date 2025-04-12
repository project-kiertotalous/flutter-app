import 'package:bl_demolition_materials/bl_demolition_materials.dart';
abstract class SPApartmentEvent {}

class PcsPerHouseChanged extends SPApartmentEvent {
  final int value;
  PcsPerHouseChanged(this.value);
}
class FloorAreaPerApartmentChanged extends SPApartmentEvent {
  final num value;
  FloorAreaPerApartmentChanged(this.value);
}
class InnerWallsPerApartmentLinearMetersChanged extends SPApartmentEvent {
  final num value;
  InnerWallsPerApartmentLinearMetersChanged(this.value);
}
class WallHeightChanged extends SPApartmentEvent {
  final num value;
  WallHeightChanged(this.value);
}
class SurfaceMaterialChanged extends SPApartmentEvent {
  final SurfaceMaterial? surfaceMaterial;
  SurfaceMaterialChanged(this.surfaceMaterial);
}

class FloorMaterialChanged extends SPApartmentEvent {
  final FloorMaterial? floorMaterial;
  FloorMaterialChanged(this.floorMaterial);
}

class KitchenWallMaterialChanged extends SPApartmentEvent {
  final KitchenWallMaterial? kitchenWallMaterial;
  KitchenWallMaterialChanged(this.kitchenWallMaterial);
}
class BathroomWallMaterialChanged extends SPApartmentEvent {
  final BathroomWallMaterial? bathroomWallMaterial;
  BathroomWallMaterialChanged(this.bathroomWallMaterial);
}
class BathroomFloorMaterialChanged extends SPApartmentEvent {
  final BathroomFloorMaterial? bathroomFloorMaterial;
  BathroomFloorMaterialChanged(this.bathroomFloorMaterial);
}
class KitchenWallMaterialAreaPerApartmentChanged extends SPApartmentEvent {
  final num value;
  KitchenWallMaterialAreaPerApartmentChanged(this.value);
}
class KitchenClosetsInLinearMeterChanged extends SPApartmentEvent {
  final num value;
  KitchenClosetsInLinearMeterChanged(this.value);
}
class AreKitchenClosetsRecyclableChanged extends SPApartmentEvent {
  final bool areKitchenClosetsRecyclable;
  AreKitchenClosetsRecyclableChanged(this.areKitchenClosetsRecyclable);
}

class DressingClosetsInLinearMeterChanged extends SPApartmentEvent {
  final num value;
  DressingClosetsInLinearMeterChanged(this.value);
}
class AreDressingClosetsRecyclableChanged extends SPApartmentEvent {
  final bool areDressingClosetsRecyclable;
  AreDressingClosetsRecyclableChanged(this.areDressingClosetsRecyclable);
}
class BathroomFloorAreaPerApartmentChanged extends SPApartmentEvent {
  final num value;
  BathroomFloorAreaPerApartmentChanged(this.value); 
}
class BathroomWallAreaPerApartmentChanged extends SPApartmentEvent {
  final num value;
  BathroomWallAreaPerApartmentChanged(this.value);
}

class SaunaPanelingAreaPerApartmentChanged extends SPApartmentEvent {
  final num value;
  SaunaPanelingAreaPerApartmentChanged(this.value);
}
class ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged extends SPApartmentEvent {
  final num value;
  ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged(this.value);
}

class IsFurnitureRecyclableChanged extends SPApartmentEvent {
  final bool isFurnitureRecyclable;
  IsFurnitureRecyclableChanged(this.isFurnitureRecyclable);
}
class ToiletSeatChanged extends SPApartmentEvent {
  final bool toiletSeat;
  ToiletSeatChanged(this.toiletSeat);
}
class CeramicSinkChanged extends SPApartmentEvent {
  final bool ceramicSink;
  CeramicSinkChanged(this.ceramicSink);
}
class RefrigeratorChanged extends SPApartmentEvent {
  final bool refrigerator;
  RefrigeratorChanged(this.refrigerator);
}
class ElectricStoveChanged extends SPApartmentEvent {
  final bool electricStove;
  ElectricStoveChanged(this.electricStove);
}
class SteelTableChanged extends SPApartmentEvent {
  final bool steelTable;
  SteelTableChanged(this.steelTable);
}
class WaterHeaterChanged extends SPApartmentEvent {
  final bool waterHeater;
  WaterHeaterChanged(this.waterHeater);
}
class SaunaStoveChanged extends SPApartmentEvent {
  final bool saunaStove;
  SaunaStoveChanged(this.saunaStove);
}