abstract class ExcavationAreaEvent {}

class AreaToRemoveSizeChanged extends ExcavationAreaEvent {
  final num amount;
  AreaToRemoveSizeChanged(this.amount);
}

class AreaToRemoveDepthChanged extends ExcavationAreaEvent {
  final num amount;
  AreaToRemoveDepthChanged(this.amount);
}

class AsphaltAreaChanged extends ExcavationAreaEvent {
  final num amount;
  AsphaltAreaChanged(this.amount);
}

class CleanSoilPortionPercentageFractionChanged extends ExcavationAreaEvent {
  final num amount;
  CleanSoilPortionPercentageFractionChanged(this.amount);
}
