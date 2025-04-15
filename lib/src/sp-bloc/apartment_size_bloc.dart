import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApartmentSizeBloc extends Bloc<SPApartmentSizeEvent, ApartmentSize> {
  ApartmentSizeBloc()
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

    on<OneRoomKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(kitchenWallMaterialAreaPerApartment: event.value)));
    });
    on<TwoRoomsKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(kitchenWallMaterialAreaPerApartment: event.value)));
    });
    on<ThreeRoomsKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(kitchenWallMaterialAreaPerApartment: event.value)));
    });
    on<FourRoomsKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(kitchenWallMaterialAreaPerApartment: event.value)));
    });

    on<OneRoomKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(kitchenClosetsInLinearMeter: event.value)));
    });
    on<TwoRoomsKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(kitchenClosetsInLinearMeter: event.value)));
    });
    on<ThreeRoomsKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(kitchenClosetsInLinearMeter: event.value)));
    });
    on<FourRoomsKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(kitchenClosetsInLinearMeter: event.value)));
    });
  
    on<OneRoomDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(dressingClosetsInLinearMeter: event.value)));
    });
    on<TwoRoomsDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(dressingClosetsInLinearMeter: event.value)));
    });
    on<ThreeRoomsDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(dressingClosetsInLinearMeter: event.value)));
    });
    on<FourRoomsDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(dressingClosetsInLinearMeter: event.value)));
    });

    on<OneRoomBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(bathroomWallAreaPerApartment: event.value)));
    });
    on<TwoRoomsBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(bathroomWallAreaPerApartment: event.value)));
    });
    on<ThreeRoomsBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(bathroomWallAreaPerApartment: event.value)));
    });
    on<FourRoomsBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(bathroomWallAreaPerApartment: event.value)));
    });

    on<OneRoomBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(bathroomFloorAreaPerApartment: event.value)));
    });
    on<TwoRoomsBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(bathroomFloorAreaPerApartment: event.value)));
    });

    on<ThreeRoomsBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(bathroomFloorAreaPerApartment: event.value)));
    });

    on<FourRoomsBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(bathroomFloorAreaPerApartment: event.value)));
    });

    on<OneRoomSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          oneRoom: state.oneRoom!
              .copyWith(saunaPanelingAreaPerApartment: event.value)));
    });
    on<TwoRoomsSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          twoRooms: state.twoRooms!
              .copyWith(saunaPanelingAreaPerApartment: event.value)));
    });
    on<ThreeRoomsSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          threeRooms: state.threeRooms!
              .copyWith(saunaPanelingAreaPerApartment: event.value)));
    });
    on<FourRoomsSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(
          fourRooms: state.fourRooms!
              .copyWith(saunaPanelingAreaPerApartment: event.value)));
    });


  }
}
