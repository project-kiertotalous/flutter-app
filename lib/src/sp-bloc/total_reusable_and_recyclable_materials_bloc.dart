import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-forms/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_reusable_and_recyclable_materials_event.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_door_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesTotalReusableAndRecyclableMaterialsBloc extends Bloc<
    SmallPropertiesTotalReusableAndRecyclableMaterialsEvent,
    SmallPropertiesTotalReusableAndRecyclableMaterials> {
  final SBExcavationAreaBloc excavationAreaBloc;
  final SmallPropertiesFoundationBloc foundationBloc;
  final SPInnerDoorsBloc innerDoorsBloc;
  final SPOuterDoorsBloc outerDoorsBloc;
  final SpWindowsBloc windowsBloc;
  final SmallPropertiesReusableAndRecyclableMaterialsBloc
      reusableAndRecyclableMaterialsBloc;

  SmallPropertiesTotalReusableAndRecyclableMaterialsBloc({
    required this.excavationAreaBloc,
    required this.foundationBloc,
    required this.innerDoorsBloc,
    required this.outerDoorsBloc,
    required this.windowsBloc,
    required this.reusableAndRecyclableMaterialsBloc,
  }) : super(
          SmallPropertiesTotalReusableAndRecyclableMaterials().copyWith(
            smallPropertiesExcavationArea: excavationAreaBloc.state,
            foundation: foundationBloc.state,
            innerDoors: innerDoorsBloc.state,
            outerDoors: outerDoorsBloc.state,
            windows: windowsBloc.state,
            reusableAndRecyclableMaterials:
                reusableAndRecyclableMaterialsBloc.state,
          ),
        ) {
    // Bloc event handlers
    on<SmallPropertiesExcavationAreaChanged>((event, emit) {
      emit(state.copyWith(smallPropertiesExcavationArea: event.excavationArea));
      logger.d(
          "smallPropertiesExcavationArea changed to: ${event.excavationArea}");
    });

    on<SmallPropertiesFoundationChanged>((event, emit) {
      emit(state.copyWith(foundation: event.foundation));
      logger.d("foundation changed to: ${event.foundation}");
    });

    on<SmallPropertyInnerDoorsChanged>((event, emit) {
      emit(state.copyWith(innerDoors: event.innerDoors));
      logger.d("innerDoors changed to: ${event.innerDoors}");
    });

    on<SmallPropertyOuterDoorsChanged>((event, emit) {
      emit(state.copyWith(outerDoors: event.outerDoors));
      logger.d("outerDoors changed to: ${event.outerDoors}");
    });

    on<SmallPropertyWindowsChanged>((event, emit) {
      emit(state.copyWith(windows: event.windows));
      logger.d("windows changed to: ${event.windows}");
    });

    on<SmallPropertiesReusableAndRecyclableMaterialsChanged>((event, emit) {
      emit(state.copyWith(
          reusableAndRecyclableMaterials:
              event.reusableAndRecyclableMaterials));
      logger.d(
          "reusableAndRecyclableMaterials changed to: ${event.reusableAndRecyclableMaterials}");
    });

    // Child bloc listeners
    excavationAreaBloc.stream.listen((state) {
      add(SmallPropertiesExcavationAreaChanged(state));
    });

    foundationBloc.stream.listen((state) {
      add(SmallPropertiesFoundationChanged(state));
    });

    innerDoorsBloc.stream.listen((state) {
      add(SmallPropertyInnerDoorsChanged(state));
    });

    outerDoorsBloc.stream.listen((state) {
      add(SmallPropertyOuterDoorsChanged(state));
    });

    windowsBloc.stream.listen((state) {
      add(SmallPropertyWindowsChanged(state));
    });

    reusableAndRecyclableMaterialsBloc.stream.listen((state) {
      add(SmallPropertiesReusableAndRecyclableMaterialsChanged(state));
    });
  }
}
