abstract class InternalWallFramesAndSurfaceMaterialEvent {}

class OverallLengthOfInternalWallsAllFloorsChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final num amount;
  OverallLengthOfInternalWallsAllFloorsChanged(this.amount);
}

class AverageHeightOfInternalWallsChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final num amount;
  AverageHeightOfInternalWallsChanged(this.amount);
}
