import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_bloc.dart';

class IntermediateFloorsBloc
    extends Bloc<IntermediateFloorsEvent, TotalIntermediateFloors> {
  final TotalBuildingDimensionsBloc totalBuildingDimensionsBloc;

  IntermediateFloorsBloc(this.totalBuildingDimensionsBloc)
      : super(TotalIntermediateFloors()) {
    
    on<TotalBuildingDimensionsChanged>((event, emit) {
      logger.d("TotalBuildingDimensionsChanged ${event.value}");
      final newState = state.copyWith(totalBuildingDimensions: event.value);
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

    on<TotalFoundationChanged>((event, emit) {
      logger.d("TotalFoundationChanged ${event.value}");

      final newState = state.copyWith(totalFoundation: event.value);

      emit(newState);
    });

    // Listen to changes from TotalBuildingDimensionsBloc
    totalBuildingDimensionsBloc.stream.listen((totalDimensionsState) {
  if (totalDimensionsState != null) {
    logger.d("Received update from TotalBuildingDimensionsBloc: $totalDimensionsState");
    add(TotalBuildingDimensionsChanged(totalDimensionsState));
  }
});
  }
}
