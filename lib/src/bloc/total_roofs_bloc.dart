import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/total_roofs_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalRoofsBloc extends Bloc<TotalRoofsEvent, TotalRoofs> {
  TotalRoofsBloc()
      : super(
          // initialize values as non-null
          TotalRoofs(
            foundations: Foundations(
              falsePlinth: FalsePlinthFoundation(),
              crawlSpace: CrawlSpaceFoundation(),
              shallow: ShallowFoundation(),
              pillar: PillarFoundation(),
              hollowCoreSlab: HollowCoreSlabFoundation(),
            ),
            roofs: Roofs(
              ceilingArea: 0,
              ridgeOrGableRoofPortionPercentage: 0,
              ridgeOrGableRoofType: RoofType.concreteBeam,
              ridgeOrGableWaterRoofType: WaterRoofType.metalRoof,
              flatOrMonoPitchedRoofType: RoofType.concreteBeam,
              flatOrMonoPitchedWaterRoofType: WaterRoofType.metalRoof,
            ),
          ),
        ) {
    on<TotalRoofsChanged>((event, emit) {
      logger.d('TotalRoofsChanged to ${event.totalRoofs}');
      emit(event.totalRoofs);
    });
    on<BituminousWaterProofingChanged>((event, emit) {
      logger.d(
          'BituminousWaterProofingChanged to ${event.bituminousWaterProofing}');
      emit(
        state.copyWith.foundations!.call(
          bituminousWaterProofing: event.bituminousWaterProofing,
        ),
      );
    });
  }
}
