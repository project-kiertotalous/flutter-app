import 'package:flutter_app/src/bloc/yard_and_protective_structures_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_and_protective_structures.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/drip_trays_and_protective_metal_sheets.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/concrete_paving_slabs.dart';

import 'package:flutter_app/log.dart';

class YardAndProtectiveStructuresBloc extends Bloc<
    YardAndProtectiveStructuresEvent, YardAndProtectiveStructures> {
  YardAndProtectiveStructuresBloc()
      : super(YardAndProtectiveStructures(
          dripTraysAndProtectiveMetalSheets: null,
          concretePavingSlabs: null,
        )) {
    // Drip Trays & Protective Metal Sheets - Square Meters & Weight
    on<DripTraysSquareMetersChanged>((event, emit) {
      logger.d("DripTraysSquareMetersChanged fired");
      emit(state.copyWith(
        dripTraysAndProtectiveMetalSheets: DripTraysAndProtectiveMetalSheets(
          squareMeters: event.value,
          weightKgPerSquareMeter:
              state.dripTraysAndProtectiveMetalSheets?.weightKgPerSquareMeter,
        ),
      ));
    });

    on<DripTraysWeightChanged>((event, emit) {
      logger.d("DripTraysWeightChanged fired");
      emit(state.copyWith(
        dripTraysAndProtectiveMetalSheets: DripTraysAndProtectiveMetalSheets(
          weightKgPerSquareMeter: event.value,
          squareMeters: state.dripTraysAndProtectiveMetalSheets?.squareMeters,
        ),
      ));
    });

    // Concrete Paving Slabs - Square Meters & Weight
    on<ConcretePavingSlabsSquareMetersChanged>((event, emit) {
      logger.d("ConcretePavingSlabsSquareMetersChanged fired");
      emit(state.copyWith(
        concretePavingSlabs: ConcretePavingSlabs(
          squareMeters: event.value,
          weightKgPerSquareMeter:
              state.concretePavingSlabs?.weightKgPerSquareMeter,
        ),
      ));
    });

    on<ConcretePavingSlabsWeightChanged>((event, emit) {
      logger.d("ConcretePavingSlabsWeightChanged fired");
      emit(state.copyWith(
        concretePavingSlabs: ConcretePavingSlabs(
          weightKgPerSquareMeter: event.value,
          squareMeters: state.concretePavingSlabs?.squareMeters,
        ),
      ));
    });
  }
}
