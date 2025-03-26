import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';
import 'door_event.dart';

class DoorBloc extends Bloc<DoorsEvent, DoorsState> {
  DoorBloc()
      : super(DoorsState(
          innerDoors: InnerDoors(
            panelDoors: null,
            woodenDoors: null,
            fireDoors: null,
            areDoorsRecyclable: false,
          ),
          outerDoors: OuterDoors(
            woodenDoors: null,
            aluminiumDoors: null,
            steelDoors: null,
            accessAndLoadingDoors: null,
            areDoorsRecyclable: false,
          ),
        )) {
    // Handle the change of recyclability of inner doors
    on<InnerDoorRecyclableChanged>((event, emit) {
      logger.d("InnerDoorRecyclableChanged: ${event.value}");
      emit(state.copyWith(
        innerDoors: state.innerDoors.copyWith(areDoorsRecyclable: event.value),
      ));
    });

    // Handle the change of recyclability of outer doors
    on<OuterDoorRecyclableChanged>((event, emit) {
      logger.d("OuterDoorRecyclableChanged: ${event.value}");
      emit(state.copyWith(
        outerDoors: state.outerDoors.copyWith(areDoorsRecyclable: event.value),
      ));
    });

    // Handle changes to the number of shut wooden doors
    on<OuterDoorWoodenShutDoorsChanged>((event, emit) {
      final updatedWoodenDoors = state.outerDoors.woodenDoors?.copyWith(
            shutDoors: event.value,
          ) ??
          OuterDoor(shutDoors: event.value);

      emit(state.copyWith(
        outerDoors: state.outerDoors.copyWith(woodenDoors: updatedWoodenDoors),
      ));

      print("Updated woodenDoors.shutDoors: ${updatedWoodenDoors.shutDoors}");
    });

    // Handle changes to the number of shut aluminium doors
    on<OuterDoorAluminiumShutDoorsChanged>((event, emit) {
      final updatedAluminiumDoors = state.outerDoors.aluminiumDoors?.copyWith(
            shutDoors: event.value,
          ) ??
          OuterDoor(shutDoors: event.value);

      emit(state.copyWith(
        outerDoors:
            state.outerDoors.copyWith(aluminiumDoors: updatedAluminiumDoors),
      ));

      print(
          "Updated aluminiumDoors.shutDoors: ${updatedAluminiumDoors.shutDoors}");
    });

    // Handle changes to the number of shut steel doors
    on<OuterDoorSteelShutDoorsChanged>((event, emit) {
      final updatedSteelDoors = state.outerDoors.steelDoors?.copyWith(
            shutDoors: event.value,
          ) ??
          OuterDoor(shutDoors: event.value);

      emit(state.copyWith(
        outerDoors: state.outerDoors.copyWith(steelDoors: updatedSteelDoors),
      ));

      print("Updated steelDoors.shutDoors: ${updatedSteelDoors.shutDoors}");
    });

    // Handle changes to the number of glass wooden doors
    on<OuterDoorWoodenGlassDoorsChanged>((event, emit) {
      final updatedWoodenDoors = state.outerDoors.woodenDoors?.copyWith(
            glassDoors: event.value,
          ) ??
          OuterDoor(glassDoors: event.value);

      emit(state.copyWith(
        outerDoors: state.outerDoors.copyWith(woodenDoors: updatedWoodenDoors),
      ));

      print("Updated woodenDoors.glassDoors: ${updatedWoodenDoors.glassDoors}");
    });

    // Handle changes to the number of glass aluminium doors
    on<OuterDoorAluminiumGlassDoorsChanged>((event, emit) {
      final updatedAluminiumDoors = state.outerDoors.aluminiumDoors?.copyWith(
            glassDoors: event.value,
          ) ??
          OuterDoor(glassDoors: event.value);

      emit(state.copyWith(
        outerDoors:
            state.outerDoors.copyWith(aluminiumDoors: updatedAluminiumDoors),
      ));

      print(
          "Updated aluminiumDoors.glassDoors: ${updatedAluminiumDoors.glassDoors}");
    });

    // Handle changes to the number of glass steel doors
    on<OuterDoorSteelGlassDoorsChanged>((event, emit) {
      final updatedSteelDoors = state.outerDoors.steelDoors?.copyWith(
            glassDoors: event.value,
          ) ??
          OuterDoor(glassDoors: event.value);

      emit(state.copyWith(
        outerDoors: state.outerDoors.copyWith(steelDoors: updatedSteelDoors),
      ));

      print("Updated steelDoors.glassDoors: ${updatedSteelDoors.glassDoors}");
    });

    // Handle changes to access and loading doors
    on<OuterDoorAccessAndLoadingDoorsChanged>((event, emit) {
      emit(state.copyWith(
        outerDoors: state.outerDoors.copyWith(
          accessAndLoadingDoors: event.value,
        ),
      ));

      print("Updated accessAndLoadingDoors: ${event.value}");
    });
  }
}

class DoorsState {
  final InnerDoors innerDoors;
  final OuterDoors outerDoors;

  DoorsState({required this.innerDoors, required this.outerDoors});

  DoorsState copyWith({InnerDoors? innerDoors, OuterDoors? outerDoors}) {
    return DoorsState(
      innerDoors: innerDoors ?? this.innerDoors,
      outerDoors: outerDoors ?? this.outerDoors,
    );
  }
}
