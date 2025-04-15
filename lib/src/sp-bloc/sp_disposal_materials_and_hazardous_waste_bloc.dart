import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/sp_disposal_materials_and_hazardous_waste_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class SpDisposalMaterialsAndHazardousWasteBloc extends Bloc<
    SpDisposalMaterialsAndHazardousWasteEvent,
    SmallPropertiesDisposalMaterialsAndHazardousWaste> {
  SpDisposalMaterialsAndHazardousWasteBloc()
      : super(SmallPropertiesDisposalMaterialsAndHazardousWaste()) {
    on<UnusableTilePorcelainGlassAndMineralInsulationProcessingCostChanged>(
        (event, emit) {
      emit(
        state.copyWith(
          unusableTilePorcelainGlassAndMineralInsulationProcessingCost:
              event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.unusableTilePorcelainGlassAndMineralInsulationProcessingCost: ${event.value}",
      );
    });
    on<NonRecyclableBrickWasteProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          nonRecyclableBrickWasteProcessingCost: event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.nonRecyclableBrickWasteProcessingCost: ${event.value}",
      );
    });
    on<NonRecyclablePlasterBoardProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          nonRecyclablePlasterBoardProcessingCost: event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.nonRecyclablePlasterBoardProcessingCost: ${event.value}",
      );
    });
    on<ContaminatedSoilProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          contaminatedSoilProcessingCost: event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.contaminatedSoilProcessingCost: ${event.value}",
      );
    });
    on<ConcreteContainingAsbestosProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          concreteContainingAsbestosProcessingCost: event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.concreteContainingAsbestosProcessingCost: ${event.value}",
      );
    });
    on<MineralWoolOrFeltRoofingContainingAsbestosProcessingCostChanged>(
        (event, emit) {
      emit(
        state.copyWith(
          mineralWoolOrFeltRoofingContainingAsbestosProcessingCost: event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.mineralWoolOrFeltRoofingContainingAsbestosProcessingCost: ${event.value}",
      );
    });
    on<ConcreteContainingPcbPaintProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          concreteContainingPcbPaintProcessingCost: event.value,
        ),
      );
      logger.d(
        "SpDisposalMaterialsAndHazardousWasteBloc.concreteContainingPcbPaintProcessingCost: ${event.value}",
      );
    });
  }
}
