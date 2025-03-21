import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart'; // Import FoundationsBloc

class IntermediateFloorsBloc
    extends Bloc<IntermediateFloorsEvent, TotalIntermediateFloors> {
  final TotalBuildingDimensionsBloc totalBuildingDimensionsBloc;
  final FoundationsBloc foundationsBloc;

  IntermediateFloorsBloc(
    this.totalBuildingDimensionsBloc,
    this.foundationsBloc,
  ) : super(TotalIntermediateFloors().copyWith(
          totalBuildingDimensions: totalBuildingDimensionsBloc.state,
          foundations: foundationsBloc.state,
          intermediateFloors: IntermediateFloors(
            hollowCoreSlabsAndGlulamBeamRecyclable: false,
          ),
        )) {
    on<TotalBuildingDimensionsChanged>((event, emit) {
      logger.d("TotalBuildingDimensionsChanged ${event.value}");
      final newState = state.copyWith(totalBuildingDimensions: event.value);
      emit(newState);
    });

    on<TotalFoundationChanged>((event, emit) {
      logger.d("TotalFoundationChanged ${event.value}");
      final newState = state.copyWith(foundations: event.value);
      emit(newState);
    });

    on<WoodFramePercentageChanged>((event, emit) {
      logger.d("WoodFramePercentageChanged ${event.value}");

      final updatedIntermediateFloors =
          (state.intermediateFloors ?? IntermediateFloors()).copyWith(
        woodFramePercentageFraction: event.value,
      );

      final newState =
          state.copyWith(intermediateFloors: updatedIntermediateFloors);

      emit(newState);
    });

    on<ConcreteCastingPercentageChanged>((event, emit) {
      logger.d("ConcreteCastingPercentageChanged ${event.value}");

      final updatedIntermediateFloors =
          (state.intermediateFloors ?? IntermediateFloors()).copyWith(
        concreteCastingPercentageFraction: event.value,
      );

      final newState =
          state.copyWith(intermediateFloors: updatedIntermediateFloors);

      emit(newState);
    });

    on<HollowCoreSlabPercentageChanged>((event, emit) {
      logger.d("HollowCoreSlabPercentageChanged ${event.value}");

      final updatedIntermediateFloors =
          (state.intermediateFloors ?? IntermediateFloors()).copyWith(
        hollowCoreSlabPercentageFraction: event.value,
      );

      final newState =
          state.copyWith(intermediateFloors: updatedIntermediateFloors);

      emit(newState);
    });

    on<GlulamBeamPercentageChanged>((event, emit) {
      logger.d("GlulamBeamPercentageChanged ${event.value}");

      final updatedIntermediateFloors =
          (state.intermediateFloors ?? IntermediateFloors()).copyWith(
        glulamBeamPercentageFraction: event.value,
      );

      final newState =
          state.copyWith(intermediateFloors: updatedIntermediateFloors);

      emit(newState);
    });

    on<HollowCoreSlabsAndGlulamBeamRecyclableChanged>((event, emit) {
      logger.d("HollowCoreSlabsAndGlulamBeamRecyclableChanged ${event.value}");

      final updatedIntermediateFloors =
          (state.intermediateFloors ?? IntermediateFloors()).copyWith(
        hollowCoreSlabsAndGlulamBeamRecyclable: event.value,
      );

      final newState =
          state.copyWith(intermediateFloors: updatedIntermediateFloors);

      emit(newState);
    });

    // Listen to changes from TotalBuildingDimensionsBloc
    totalBuildingDimensionsBloc.stream.listen((totalDimensionsState) {
      logger.d(
          "Received update from TotalBuildingDimensionsBloc: $totalDimensionsState");
      add(TotalBuildingDimensionsChanged(totalDimensionsState));
    });

    // Listen to changes from FoundationsBloc
    foundationsBloc.stream.listen((foundationsState) {
      logger.d("Received update from FoundationsBloc: $foundationsState");
      // You can add specific events to handle foundation updates if necessary
      add(TotalFoundationChanged(
          foundationsState)); // Add custom event for foundations
    });
  }
}
