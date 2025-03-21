import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/total_building_dimensions.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/foundations.dart';

abstract class IntermediateFloorsEvent {}

class WoodFramePercentageChanged extends IntermediateFloorsEvent {
  final num value;
  WoodFramePercentageChanged(this.value);
}

class ConcreteCastingPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  ConcreteCastingPercentageChanged(this.value);
}

class HollowCoreSlabPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  HollowCoreSlabPercentageChanged(this.value);
}

class GlulamBeamPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  GlulamBeamPercentageChanged(this.value);
}

class TotalBuildingDimensionsChanged extends IntermediateFloorsEvent {
  final TotalBuildingDimensions value;
  TotalBuildingDimensionsChanged(this.value);
}

class TotalFoundationChanged extends IntermediateFloorsEvent {
  final Foundations value;
  TotalFoundationChanged(this.value);
}

class HollowCoreSlabsAndGlulamBeamRecyclableChanged
    extends IntermediateFloorsEvent {
  final bool value;
  HollowCoreSlabsAndGlulamBeamRecyclableChanged(this.value);
}
