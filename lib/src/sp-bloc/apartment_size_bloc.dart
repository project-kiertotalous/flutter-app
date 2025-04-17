import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
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
      emit(
        state.copyWith.oneRoom!(
          pcsPerHouse: event.value,
        ),
      );
      logger.d('ApartmentSizeBloc.oneRoom: ${state.oneRoom}');
    });
    on<TwoRoomsPcsPerHouseChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          pcsPerHouse: event.value,
        ),
      );
    });
    on<ThreeRoomsPcsPerHouseChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          pcsPerHouse: event.value,
        ),
      );
    });
    on<FourRoomsPcsPerHouseChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          pcsPerHouse: event.value,
        ),
      );
    });

    on<OneRoomFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          floorAreaPerApartment: event.value,
        ),
      );
    });
    on<TwoRoomsFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          floorAreaPerApartment: event.value,
        ),
      );
    });
    on<ThreeRoomsFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          floorAreaPerApartment: event.value,
        ),
      );
    });
    on<FourRoomsFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          floorAreaPerApartment: event.value,
        ),
      );
    });
    on<OneRoomInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          innerWallsPerApartmentLinearMeters: event.value,
        ),
      );
    });
    on<TwoRoomsInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          innerWallsPerApartmentLinearMeters: event.value,
        ),
      );
    });
    on<ThreeRoomsInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          innerWallsPerApartmentLinearMeters: event.value,
        ),
      );
    });
    on<FourRoomsInnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          innerWallsPerApartmentLinearMeters: event.value,
        ),
      );
    });
    on<OneRoomWallHeightChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          wallHeight: event.value,
        ),
      );
    });
    on<TwoRoomsWallHeightChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          wallHeight: event.value,
        ),
      );
    });
    on<ThreeRoomsWallHeightChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          wallHeight: event.value,
        ),
      );
    });
    on<FourRoomsWallHeightChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          wallHeight: event.value,
        ),
      );
    });

    on<OneRoomKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          kitchenWallMaterialAreaPerApartment: event.value,
        ),
      );
    });
    on<TwoRoomsKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          kitchenWallMaterialAreaPerApartment: event.value,
        ),
      );
    });
    on<ThreeRoomsKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          kitchenWallMaterialAreaPerApartment: event.value,
        ),
      );
    });
    on<FourRoomsKitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          kitchenWallMaterialAreaPerApartment: event.value,
        ),
      );
    });

    on<OneRoomKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          kitchenClosetsInLinearMeter: event.value,
        ),
      );
    });
    on<TwoRoomsKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          kitchenClosetsInLinearMeter: event.value,
        ),
      );
    });
    on<ThreeRoomsKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          kitchenClosetsInLinearMeter: event.value,
        ),
      );
    });
    on<FourRoomsKitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          kitchenClosetsInLinearMeter: event.value,
        ),
      );
    });

    on<OneRoomDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          dressingClosetsInLinearMeter: event.value,
        ),
      );
    });
    on<TwoRoomsDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          dressingClosetsInLinearMeter: event.value,
        ),
      );
    });
    on<ThreeRoomsDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          dressingClosetsInLinearMeter: event.value,
        ),
      );
    });
    on<FourRoomsDressingClosetsInLinearMeterChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          dressingClosetsInLinearMeter: event.value,
        ),
      );
    });

    on<OneRoomBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          bathroomWallAreaPerApartment: event.value,
        ),
      );
    });
    on<TwoRoomsBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          bathroomWallAreaPerApartment: event.value,
        ),
      );
    });
    on<ThreeRoomsBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          bathroomWallAreaPerApartment: event.value,
        ),
      );
    });
    on<FourRoomsBathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          bathroomWallAreaPerApartment: event.value,
        ),
      );
    });

    on<OneRoomBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          bathroomFloorAreaPerApartment: event.value,
        ),
      );
    });
    on<TwoRoomsBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          bathroomFloorAreaPerApartment: event.value,
        ),
      );
    });

    on<ThreeRoomsBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          bathroomFloorAreaPerApartment: event.value,
        ),
      );
    });

    on<FourRoomsBathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          bathroomFloorAreaPerApartment: event.value,
        ),
      );
    });

    on<OneRoomSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.oneRoom!(
          saunaPanelingAreaPerApartment: event.value,
        ),
      );
    });
    on<TwoRoomsSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.twoRooms!(
          saunaPanelingAreaPerApartment: event.value,
        ),
      );
    });
    on<ThreeRoomsSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.threeRooms!(
          saunaPanelingAreaPerApartment: event.value,
        ),
      );
    });
    on<FourRoomsSaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(
        state.copyWith.fourRooms!(
          saunaPanelingAreaPerApartment: event.value,
        ),
      );
    });
  }
}
