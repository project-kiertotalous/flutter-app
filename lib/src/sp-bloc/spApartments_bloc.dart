import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/spApartments_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class SPApartmentsBloc extends Bloc<SPApartmentsEvent, SPApartmentsState> {
  final ApartmentBloc apartmentBloc;
  final ApartmentSizeBloc apartmentSizeBloc;
  SPApartmentsBloc({
    required this.apartmentBloc,
    required this.apartmentSizeBloc,
  }) : super(SPApartmentsState(
          apartment: apartmentBloc.state,
          apartmentSize: apartmentSizeBloc.state,
        )) {
    on<ApartmentChanged>((event, emit) {
      emit(state.copyWith(apartment: event.apartment));
      logger.d("SPApartmentsBloc.apartment: ${event.apartment}");
    });
    on<ApartmentSizeChanged>((event, emit) {
      emit(state.copyWith(apartmentSize: event.apartmentSize));
      logger.d("SPApartmentsBloc.apartmentSize: ${event.apartmentSize}");
    });

    // listen to other sp apartment blocs
    apartmentBloc.stream.listen((apartmentState) {
      add(ApartmentChanged(apartmentState));
    });
    apartmentSizeBloc.stream.listen((apartmentSizeState) {
      add(ApartmentSizeChanged(apartmentSizeState));
    });
  }
}

class SPApartmentsState {
  final Apartment apartment;
  final ApartmentSize apartmentSize;

  SPApartmentsState({
    required this.apartment,
    required this.apartmentSize,
  });

  SPApartmentsState copyWith({
    Apartment? apartment,
    ApartmentSize? apartmentSize,
  }) {
    return SPApartmentsState(
      apartment: apartment ?? this.apartment,
      apartmentSize: apartmentSize ?? this.apartmentSize,
    );
  }
}
