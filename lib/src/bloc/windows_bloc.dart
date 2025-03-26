import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/bloc/windows_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WindowsBloc extends Bloc<WindowsEvent, Windows> {
  WindowsBloc() : super(Windows(
            // Add other fields here as needed
            )) {
    on<WindowsAreaChanged>((event, emit) {
      logger.d("WindowsAreaChanged fired");
    });

    on<WindowsHeightChanged>((event, emit) {
      logger.d("WindowsHeightChanged fired");
    });

    // Add more event handlers here as needed
  }
}
