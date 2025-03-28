import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_event.dart';
import 'package:flutter_app/src/bloc/total_building_frame_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBuildingFrameBloc
    extends Bloc<TotalBuildingFrameEvent, TotalBuildingFrame> {
  TotalBuildingFrameBloc()
      : super(TotalBuildingFrame(
          totalFoundations: Foundations(),
          buildingFrame: BuildingFrame(),
        )) {
    on<FoundationsChanged>((event, emit) {
      logger.d('FoundationsChanged in TotalBuildingFrameBloc');
      emit(state.copyWith(totalFoundations: event.foundations));
    });
    on<BuildingFrameChanged>((event, emit) {
      emit(state.copyWith(buildingFrame: event.buildingFrame));
    });
  }
}
