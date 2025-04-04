import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/building_dimensions_bloc.dart';
import 'package:flutter_app/src/bloc/cellar_bloc.dart';
import 'package:flutter_app/src/bloc/foundations_bloc.dart';
import 'package:flutter_app/src/bloc/total_building_dimensions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBuildingDimensionsBloc
    extends Bloc<TotalBuildingDimensionsEvent, TotalBuildingDimensions> {
  final FoundationsBloc foundationsBloc;
  final CellarBloc cellarBloc;
  final BuildingDimensionsBloc buildingDimensionsBloc;

  TotalBuildingDimensionsBloc(
    this.foundationsBloc,
    this.cellarBloc,
    this.buildingDimensionsBloc,
  ) : super(
          TotalBuildingDimensions().copyWith(
            foundations: foundationsBloc.state,
            cellar: cellarBloc.state,
            buildingDimensions: buildingDimensionsBloc.state,
          ),
        ) {
    on<BuildingDimensionsChanged>((event, emit) {
      logger.d(
          "TotalBuildingDimensions.buildingDimensions changed to ${event.buildingDimensions}");
      emit(
        state.copyWith(buildingDimensions: event.buildingDimensions),
      );
    });
    on<CellarChanged>((event, emit) {
      logger.d("TotalBuildingDimensions.cellar changed to: ${event.cellar}");
      emit(
        state.copyWith(cellar: event.cellar),
      );
    });
    on<FoundationsChanged>((event, emit) {
      logger.d(
          "TotalBuildingDimensions.foundations changed to: ${event.foundations}");
      emit(
        state.copyWith(foundations: event.foundations),
      );
    });

    // updates this bloc when FoundationsBloc is changed elsewhere
    foundationsBloc.stream.listen((foundationsState) {
      // logger.d('Received update from FoundationsBloc: $foundationsState');
      add(FoundationsChanged(foundationsState));
    });

    // updates this bloc when CellarBloc is changed elsewhere
    cellarBloc.stream.listen((cellarState) {
      // logger.d('Received update from FoundationsBloc: $foundationsState');
      add(CellarChanged(cellarState));
    });

    // updates this bloc when BuildingDimensionsBloc is changed elsewhere
    buildingDimensionsBloc.stream.listen((buildingDimensionsState) {
      // logger.d('Received update from FoundationsBloc: $foundationsState');
      add(BuildingDimensionsChanged(buildingDimensionsState));
    });
  }
}
