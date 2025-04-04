import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalBuildingDimensionsEvent {}

class BuildingDimensionsChanged extends TotalBuildingDimensionsEvent {
  BuildingDimensions buildingDimensions;
  BuildingDimensionsChanged(this.buildingDimensions);
}

class CellarChanged extends TotalBuildingDimensionsEvent {
  Cellar cellar;
  CellarChanged(this.cellar);
}

class FoundationsChanged extends TotalBuildingDimensionsEvent {
  Foundations foundations;
  FoundationsChanged(this.foundations);
}
