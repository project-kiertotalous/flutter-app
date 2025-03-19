abstract class TotalBuildingDimensionsEvent {}

class GrossFloorAreaChanged extends TotalBuildingDimensionsEvent {
  final num value;
  GrossFloorAreaChanged(this.value);
}

class VolumeChanged extends TotalBuildingDimensionsEvent {
  final num value;
  VolumeChanged(this.value);
}

class FloorCountExcludingCellarsChanged extends TotalBuildingDimensionsEvent {
  final int value;
  FloorCountExcludingCellarsChanged(this.value);
}

class AverageAreaChanged extends TotalBuildingDimensionsEvent {
  final num value;
  AverageAreaChanged(this.value);
}
