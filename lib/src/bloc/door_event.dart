import 'package:equatable/equatable.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/inner_doors.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/outer_doors.dart';

abstract class DoorsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Existing event for changing inner doors
class InnerDoorChanged extends DoorsEvent {
  final InnerDoors innerDoors;
  InnerDoorChanged(this.innerDoors);

  @override
  List<Object?> get props => [innerDoors];
}

// Existing event for changing outer doors
class OuterDoorChanged extends DoorsEvent {
  final OuterDoors outerDoors;
  OuterDoorChanged(this.outerDoors);

  @override
  List<Object?> get props => [outerDoors];
}

// Event for inner doors recyclability change
class InnerDoorRecyclableChanged extends DoorsEvent {
  final bool value;

  InnerDoorRecyclableChanged(this.value);
}

// Event for outer doors recyclability change
class OuterDoorRecyclableChanged extends DoorsEvent {
  final bool value;

  OuterDoorRecyclableChanged(this.value);
}

// Event for changing the number of shut doors for outer doors
class OuterDoorWoodenShutDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorWoodenShutDoorsChanged(this.value);
}

class OuterDoorAluminiumShutDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorAluminiumShutDoorsChanged(this.value);
}

class OuterDoorSteelShutDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorSteelShutDoorsChanged(this.value);
}

// Event for changing the number of glass doors for outer doors
class OuterDoorWoodenGlassDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorWoodenGlassDoorsChanged(this.value);
}

class OuterDoorAluminiumGlassDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorAluminiumGlassDoorsChanged(this.value);
}

class OuterDoorSteelGlassDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorSteelGlassDoorsChanged(this.value);
}

// Event for changing access and loading doors
class OuterDoorAccessAndLoadingDoorsChanged extends DoorsEvent {
  final int value;
  OuterDoorAccessAndLoadingDoorsChanged(this.value);
}

// Event for changing the number of shut doors for panel doors
class InnerDoorPanelShutDoorsChanged extends DoorsEvent {
  final int value;

  InnerDoorPanelShutDoorsChanged(this.value);

  @override
  List<Object?> get props => [value];
}

// Event for changing the number of shut doors for wooden doors
class InnerDoorWoodenShutDoorsChanged extends DoorsEvent {
  final int value;

  InnerDoorWoodenShutDoorsChanged(this.value);

  @override
  List<Object?> get props => [value];
}

// Event for changing the number of shut doors for fire doors
class InnerDoorFireShutDoorsChanged extends DoorsEvent {
  final int value;

  InnerDoorFireShutDoorsChanged(this.value);

  @override
  List<Object?> get props => [value];
}

// Event for changing the number of glass doors for panel doors
class InnerDoorPanelGlassDoorsChanged extends DoorsEvent {
  final int value;

  InnerDoorPanelGlassDoorsChanged(this.value);

  @override
  List<Object?> get props => [value];
}

// Event for changing the number of glass doors for wooden doors
class InnerDoorWoodenGlassDoorsChanged extends DoorsEvent {
  final int value;

  InnerDoorWoodenGlassDoorsChanged(this.value);

  @override
  List<Object?> get props => [value];
}
