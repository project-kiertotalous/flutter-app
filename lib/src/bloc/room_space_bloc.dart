import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/room_space_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomSpaceBloc extends Bloc<RoomSpaceEvent, RoomSpace> {
  RoomSpaceBloc() : super(RoomSpace()) {
    on<WoodFrameWallsChanged>((event, emit) {
      logger.d('WoodFramedWalls changed to: ${event.value}');
      emit(state.copyWith(woodFramedWalls: event.value));
    });

    on<BrickWallsChanged>((event, emit) {
      logger.d('BrickWalls changed to: ${event.value}');
      emit(state.copyWith(brickWalls: event.value));
    });
    on<ConcreteElementOrCastingWallsChanged>((event, emit) {
      logger.d('ConcreteElementOrCastingWalls changed to: ${event.value}');
      emit(state.copyWith(concreteElementOrCastingWalls: event.value));
    });

    on<ChipboardPortionPercentageChanged>((event, emit) {
      logger.d('ChipboardPortionPercentage changed to: ${event.value}');
      emit(state.copyWith(chipboardPortionPercentage: event.value));
    });

    on<CybrocPortionPercentageChanged>((event, emit) {
      logger.d('CybrocPortionPercentage changed to: ${event.value}');
      emit(state.copyWith(cybrocPortionPercentage: event.value));
    });

    on<BoardPanelPortionPercentageChanged>((event, emit) {
      logger.d('BoardPanelPortionPercentage changed to: ${event.value}');
      emit(state.copyWith(boardPanelPortionPercentage: event.value));
    });

    on<CeramicTileWallsPortionPercentageChanged>((event, emit) {
      logger.d('CeramicTileWallsPortionPercentage changed to: ${event.value}');
      emit(state.copyWith(ceramicTileWallsPortionPercentage: event.value));
    });

    on<PaintedPlasteredBrickWallPortionPercentageChanged>((event, emit) {
      logger.d(
          'PaintedPlasteredBrickWallPortionPercentage changed to: ${event.value}');
      emit(state.copyWith(
          paintedPlasteredBrickWallPortionPercentage: event.value));
    });

    on<PlasticCarpetPortionPercentageChanged>((event, emit) {
      logger.d('PlasticCarpetPortionPercentage changed to: ${event.value}');
      emit(state.copyWith(plasticCarpetPortionPercentage: event.value));
    });
  }
}
