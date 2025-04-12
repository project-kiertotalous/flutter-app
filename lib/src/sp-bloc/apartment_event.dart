import 'package:bl_demolition_materials/bl_demolition_materials.dart';
abstract class SPApartmentEvent {}

class PcsPerHouseChanged extends SPApartmentEvent {
  final int pcsPerHouse;
  PcsPerHouseChanged(this.pcsPerHouse);
}
class FloorAreaPerApartmentChanged extends SPApartmentEvent {
  final num floorAreaPerApartment;
  FloorAreaPerApartmentChanged(this.floorAreaPerApartment);
}
class InnerWallsPerApartmentLinearMetersChanged extends SPApartmentEvent {
  final num innerWallsPerApartmentLinearMeters;
  InnerWallsPerApartmentLinearMetersChanged(this.innerWallsPerApartmentLinearMeters);
}
class WallHeightChanged extends SPApartmentEvent {
  final num wallHeight;
  WallHeightChanged(this.wallHeight);
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
  final num kitchenWallMaterialAreaPerApartment;
  KitchenWallMaterialAreaPerApartmentChanged(this.kitchenWallMaterialAreaPerApartment);
}
class KitchenClosetsInLinearMeterChanged extends SPApartmentEvent {
  final num kitchenClosetsInLinearMeter;
  KitchenClosetsInLinearMeterChanged(this.kitchenClosetsInLinearMeter);
}
class AreKitchenClosetsRecyclableChanged extends SPApartmentEvent {
  final bool areKitchenClosetsRecyclable;
  AreKitchenClosetsRecyclableChanged(this.areKitchenClosetsRecyclable);
}

class DressingClosetsInLinearMeterChanged extends SPApartmentEvent {
  final num dressingClosetsInLinearMeter;
  DressingClosetsInLinearMeterChanged(this.dressingClosetsInLinearMeter);
}
class AreDressingClosetsRecyclableChanged extends SPApartmentEvent {
  final bool areDressingClosetsRecyclable;
  AreDressingClosetsRecyclableChanged(this.areDressingClosetsRecyclable);
}
class BathroomWallAreaPerApartmentChanged extends SPApartmentEvent {
  final num bathroomWallAreaPerApartment;
  BathroomWallAreaPerApartmentChanged(this.bathroomWallAreaPerApartment);
}
class BathroomFloorAreaPerApartmentChanged extends SPApartmentEvent {
  final num bathroomFloorAreaPerApartment;
  BathroomFloorAreaPerApartmentChanged(this.bathroomFloorAreaPerApartment);
}
class SaunaPanelingAreaPerApartmentChanged extends SPApartmentEvent {
  final num saunaPanelingAreaPerApartment;
  SaunaPanelingAreaPerApartmentChanged(this.saunaPanelingAreaPerApartment);
}
class ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged extends SPApartmentEvent {
  final num apartmentSpecificKitchenToiletOrSaunaFurniture;
  ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged(this.apartmentSpecificKitchenToiletOrSaunaFurniture);
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