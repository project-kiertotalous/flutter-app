import 'package:bl_demolition_materials/bl_demolition_materials.dart';
// import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/floor_structures_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloorStructuresBloc extends Bloc<FloorStructuresEvent, FloorStructures> {
  FloorStructuresBloc() : super(FloorStructures()) {
    // on<OfficeSpacesChanged>((event, emit) {
    //   logger.d("OfficeSpacesChanged to ${event.floorStructure}");

    //   );
    // });
  }
}
