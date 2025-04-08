abstract class SBExcavationAreaEvent {}

class AreofTheRemovableSoilChanged extends SBExcavationAreaEvent {
  final num value;
  AreofTheRemovableSoilChanged(this.value);
}

class DepthInMetersChanged extends SBExcavationAreaEvent {
  final num value;
  DepthInMetersChanged(this.value);
}

class AsphaltAreaInSquareMetersChanged extends SBExcavationAreaEvent {
  final num value;
  AsphaltAreaInSquareMetersChanged(this.value);
}

