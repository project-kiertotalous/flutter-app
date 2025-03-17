import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/bloc/intermediate_floors_event.dart';
import 'package:flutter_app/log.dart';

class IntermediateFloorsBloc
    extends Bloc<IntermediateFloorsEvent, IntermediateFloors> {
  IntermediateFloorsBloc()
      : super(const IntermediateFloors(
          woodFramePercentageFraction: 0,
          concreteCastingPercentageFraction: 0,
          hollowCoreSlabPercentageFraction: 0,
          glulamBeamPercentageFraction: 0,
          hollowCoreSlabsAndGlulamBeamRecyclable: false,
        )) {
    on<WoodFrameAreaChanged>((event, emit) {
      logger.d("WoodFrameAreaChanged fired");
      _updateState(emit, woodFrame: event.value);
    });

    on<ConcreteCastingAreaChanged>((event, emit) {
      logger.d("ConcreteCastingAreaChanged fired");
      _updateState(emit, concreteCasting: event.value);
    });

    on<HollowCoreSlabAreaChanged>((event, emit) {
      logger.d("HollowCoreSlabAreaChanged fired");
      _updateState(emit, hollowCoreSlab: event.value);
    });

    on<GlulamBeamAreaChanged>((event, emit) {
      logger.d("GlulamBeamAreaChanged fired");
      _updateState(emit, glulamBeam: event.value);
    });

    on<TotalFloorAreaPercentageChanged>((event, emit) {
      logger.d("TotalFloorAreaPercentageChanged fired");
      _updateState(emit, totalPercentage: event.value);
    });
  }

  void _updateState(
    Emitter<IntermediateFloors> emit, {
    num? woodFrame,
    num? concreteCasting,
    num? hollowCoreSlab,
    num? glulamBeam,
    num? totalPercentage,
  }) {
    final newState = state.copyWith(
      woodFramePercentageFraction:
          woodFrame ?? state.woodFramePercentageFraction,
      concreteCastingPercentageFraction:
          concreteCasting ?? state.concreteCastingPercentageFraction,
      hollowCoreSlabPercentageFraction:
          hollowCoreSlab ?? state.hollowCoreSlabPercentageFraction,
      glulamBeamPercentageFraction:
          glulamBeam ?? state.glulamBeamPercentageFraction,
    );

    if (newState.totalFraction > 1) {
      logger.e("Total percentage cannot exceed 100%");
      return;
    }

    emit(newState);
  }
}
