import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apartment_bloc.dart';

class SPApartmentSizeBloc extends Bloc<SPApartmentSizeEvent, ApartmentSize> {
  final SPApartmentBloc apartmentBloc;
  SPApartmentSizeBloc({required this.apartmentBloc})
      : super(ApartmentSize()) {
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

    apartmentBloc.stream.listen((state) {
      add(ApartmentChanged(state));
    });
  }
}
