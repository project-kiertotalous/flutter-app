import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/building_frame_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingFrameBloc extends Bloc<BuildingFrameEvent, BuildingFrame> {
  BuildingFrameBloc() : super(BuildingFrame()) {
    on<UseFoundationCircumferenceChanged>(
      (event, emit) {
        logger.d('useFoundationCircumference changed to: ${event.value}');
        emit(
          state.copyWith(useFoundationCircumference: event.value),
        );
      },
    );
    on<ExternalWallsPerimeterChanged>(
      (event, emit) {
        logger.d('externalWallsPerimeter changed to: ${event.value}');
        emit(
          state.copyWith(externalWallsPerimeter: event.value),
        );
      },
    );
    on<ExternalWallsAverageHeightChanged>(
      (event, emit) {
        logger.d('externalWallsAverageHeight changed to: ${event.value}');
        emit(
          state.copyWith(externalWallsAverageHeight: event.value),
        );
      },
    );
    on<AreMaterialsRecyclableChanged>(
      (event, emit) {
        logger.d('areMaterialsRecyclable changed to: ${event.value}');
        emit(
          state.copyWith(areMaterialsRecyclable: event.value),
        );
      },
    );
    on<WoodPortionPercentageChanged>(
      (event, emit) {
        logger.d('woodPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(woodPortionPercentage: event.value),
        );
      },
    );
    on<GlulamVerticalColumnsPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'glulamVerticalColumnsPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            glulamVerticalColumnsPortionPercentage: event.value,
          ),
        );
      },
    );
    on<ConcreteVerticalColumnsPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'concreteVerticalColumnsPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            concreteVerticalColumnsPortionPercentage: event.value,
          ),
        );
      },
    );
    on<SteelVerticalColumnsPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'steelVerticalColumnsPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            steelVerticalColumnsPortionPercentage: event.value,
          ),
        );
      },
    );
    on<DoubleLoadBearingBrickWallPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'doubleLoadBearingBrickWallPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            doubleLoadBearingBrickWallPortionPercentage: event.value,
          ),
        );
      },
    );
    on<ConcreteElementWallsWithoutFrameworkPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'concreteElementWallsWithoutFrameworkPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            concreteElementWallsWithoutFrameworkPortionPercentage: event.value,
          ),
        );
      },
    );
    on<BrickCladWallPortionPercentageChanged>(
      (event, emit) {
        logger.d('brickCladWallPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            brickCladWallPortionPercentage: event.value,
          ),
        );
      },
    );
    on<BoardWallPortionPercentageChanged>(
      (event, emit) {
        logger.d('boardWallPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            boardWallPortionPercentage: event.value,
          ),
        );
      },
    );
    on<ProfiledSheetMetalPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'profiledSheetMetalPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            profiledSheetMetalPortionPercentage: event.value,
          ),
        );
      },
    );
    on<SteelProfileSandwichStructurePortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'steelProfileSandwichStructurePortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            steelProfileSandwichStructurePortionPercentage: event.value,
          ),
        );
      },
    );
    on<MineriteOrOtherStoneBoardPortionPercentageChanged>(
      (event, emit) {
        logger.d(
            'mineriteOrOtherStoneBoardPortionPercentage changed to: ${event.value}');
        emit(
          state.copyWith(
            mineriteOrOtherStoneBoardPortionPercentage: event.value,
          ),
        );
      },
    );
  }
}
