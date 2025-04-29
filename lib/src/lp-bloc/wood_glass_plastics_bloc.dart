import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'wood_glass_plastics_event.dart';

class WoodGlassPlasticsBloc
    extends Bloc<WoodGlassPlasticsEvent, WoodGlassPlastics> {
  final LargePropertiesRepository repository; //Add repository reference
  WoodGlassPlasticsBloc({
    required this.repository,
    WoodGlassPlastics? initialState,
  }) : super(WoodGlassPlastics()) {
    on<WoodNotesChanged>((event, emit) {
      emit(state.copyWith(woodNotes: event.value));
    });
    on<WoodNotesChanged>((event, emit) {
      emit(state.copyWith(woodNotes: event.value));
    });

    on<GlassNotesChanged>((event, emit) {
      emit(state.copyWith(glassNotes: event.value));
    });

    on<PlasticNotesChanged>((event, emit) {
      emit(state.copyWith(plasticNotes: event.value));
    });

    on<OtherDangerousMaterialsNotesChanged>((event, emit) {
      emit(state.copyWith(
          otherDangerousOrContaminatedMaterialsNotes: event.value));
    });
  }
}
