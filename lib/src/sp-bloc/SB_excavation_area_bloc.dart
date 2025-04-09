import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'SB_excavation_area_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SBExcavationAreaBloc
    extends Bloc<SBExcavationAreaEvent, SmallPropertiesExcavationArea> {
  SBExcavationAreaBloc() : super(SmallPropertiesExcavationArea()) {
    on<AreaofTheRemovableSoilChanged>((event, emit) {
      logger.d("AreaOfTheRemovableSoil changed to ${event.value}");
      emit(
        state.copyWith(
          areOfTheRemovableSoil: event.value,
        ),
      );
    });

    on<DepthInMetersChanged>((event, emit) {
      logger.d("DepthInMetersChanged to ${event.value}");
      emit(
        state.copyWith(
          depthInMeters: event.value,
        ),
      );
    });
    on<AsphaltAreaInSquareMetersChanged>((event, emit) {
      logger.d("AsphaltAreaInSquareMetersChanged to ${event.value}");
      emit(
        state.copyWith(
          asphaltAreaInSquareMeters: event.value,
        ),
      );
    });

  }
}
