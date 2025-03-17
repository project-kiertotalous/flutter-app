abstract class IntermediateFloorsEvent {}

// Event for changing the wood frame area
class WoodFrameAreaChanged extends IntermediateFloorsEvent {
  final num value;
  WoodFrameAreaChanged(this.value);
}

// Event for changing the concrete casting area
class ConcreteCastingAreaChanged extends IntermediateFloorsEvent {
  final num value;
  ConcreteCastingAreaChanged(this.value);
}

// Event for changing the hollow core slab area
class HollowCoreSlabAreaChanged extends IntermediateFloorsEvent {
  final num value;
  HollowCoreSlabAreaChanged(this.value);
}

// Event for changing the glulam beam area
class GlulamBeamAreaChanged extends IntermediateFloorsEvent {
  final num value;
  GlulamBeamAreaChanged(this.value);
}

// Event for changing the total floor area percentage
class TotalFloorAreaPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  TotalFloorAreaPercentageChanged(this.value);
}
