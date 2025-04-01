import 'package:equatable/equatable.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/total/total_building_frame.dart';

abstract class DoubleLoadBearingBrickWallEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadData extends DoubleLoadBearingBrickWallEvent {
  final TotalBuildingFrame totalBuildingFrame;

  LoadData(this.totalBuildingFrame);

  @override
  List<Object?> get props => [totalBuildingFrame];
}
