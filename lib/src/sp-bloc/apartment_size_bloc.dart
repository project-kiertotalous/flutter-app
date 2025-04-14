import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apartment_bloc.dart';

class SPApartmentSizeBloc extends Bloc<SPApartmentSizeEvent, ApartmentSize> {

  SPApartmentSizeBloc()
      : super(ApartmentSize(
          oneRoom: Apartment(),
          twoRooms: Apartment(),
          threeRooms: Apartment(),
          fourRooms: Apartment(),
        )) {
    on<OneRoomPcsPerHouseChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!.copyWith(pcsPerHouse: event.value)));
    });
    on<TwoRoomsPcsPerHouseChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!.copyWith(pcsPerHouse: event.value)));
    });
    on<ThreeRoomsPcsPerHouseChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!.copyWith(pcsPerHouse: event.value)));
    });
    on<FourRoomsPcsPerHouseChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!.copyWith(pcsPerHouse: event.value)));
    });

    on<OneRoomFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom:
              state.oneRoom!.copyWith(floorAreaPerApartment: event.value)));
    });
    on<TwoRoomsFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms:
              state.twoRooms!.copyWith(floorAreaPerApartment: event.value)));
    });
    on<ThreeRoomsFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms:
              state.threeRooms!.copyWith(floorAreaPerApartment: event.value)));
    });
    on<FourRoomsFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms:
              state.fourRooms!.copyWith(floorAreaPerApartment: event.value)));
    });
    on<OneRoomInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(innerWallsPerApartmentLinearMeters: event.value)));
    });
    on<TwoRoomsInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(innerWallsPerApartmentLinearMeters: event.value)));
    });
    on<ThreeRoomsInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(innerWallsPerApartmentLinearMeters: event.value)));
    });
    on<FourRoomsInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(innerWallsPerApartmentLinearMeters: event.value)));
    });
    on<OneRoomWallHeightChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!.copyWith(wallHeight: event.value)));
    });
    on<TwoRoomsWallHeightChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!.copyWith(wallHeight: event.value)));
    });
    on<ThreeRoomsWallHeightChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!.copyWith(wallHeight: event.value)));
    });
    on<FourRoomsWallHeightChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!.copyWith(wallHeight: event.value)));
    });

    on<SurfaceMaterialChanged>((event, emit) {
      emit(state.copyWith(
        oneRoom:
            state.oneRoom?.copyWith(surfaceMaterial: event.surfaceMaterial),
        twoRooms:
            state.twoRooms?.copyWith(surfaceMaterial: event.surfaceMaterial),
        threeRooms:
            state.threeRooms?.copyWith(surfaceMaterial: event.surfaceMaterial),
        fourRooms:
            state.fourRooms?.copyWith(surfaceMaterial: event.surfaceMaterial),
      ));
    });

    on<FloorMaterialChanged>((event, emit) {
      emit(state.copyWith(
        oneRoom:
            state.oneRoom?.copyWith(floorMaterial: event.floorMaterial),
        twoRooms:
            state.twoRooms?.copyWith(floorMaterial: event.floorMaterial),
        threeRooms:
            state.threeRooms?.copyWith(floorMaterial: event.floorMaterial),
        fourRooms:
            state.fourRooms?.copyWith(floorMaterial: event.floorMaterial),
      ));
    });
    on<KitchenWallMaterialChanged>((event, emit) {
      emit(state.copyWith(
        oneRoom: state.oneRoom?.copyWith(kitchenWallMaterial: event.kitchenWallMaterial),
        twoRooms: state.twoRooms?.copyWith(kitchenWallMaterial: event.kitchenWallMaterial),
        threeRooms: state.threeRooms?.copyWith(kitchenWallMaterial: event.kitchenWallMaterial),
        fourRooms: state.fourRooms?.copyWith(kitchenWallMaterial: event.kitchenWallMaterial),
      ));
    });
  }
}
