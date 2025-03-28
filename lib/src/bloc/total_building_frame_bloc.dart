import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_frame_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBuildingFrameBloc
    extends Bloc<TotalBuildingFrameEvent, TotalBuildingFrame> {
  final FoundationsBloc foundationsBloc;

  TotalBuildingFrameBloc(
    this.foundationsBloc,
  ) : super(
          TotalBuildingFrame().copyWith(
            foundations: foundationsBloc.state,
            buildingFrame: BuildingFrame(),
          ),
        ) {
    on<FoundationsChanged>(
      (event, emit) {
        logger.d('FoundationsChanged in TotalBuildingFrameBloc');
        emit(
          state.copyWith(
            foundations: event.foundations,
          ),
        );
        // logger.d('totalbuildingframebloc state: $state');
      },
    );

    on<BuildingFrameChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            buildingFrame: event.buildingFrame,
          ),
        );
        // logger.d('totalbuildingframebloc state: $state');
      },
    );

    // updates this bloc when foundationsBloc is changed elsewhere
    foundationsBloc.stream.listen((foundationsState) {
      logger.d('Received update from FoundationsBloc: $foundationsState');

      add(FoundationsChanged(foundationsState));
    });
  }
}
