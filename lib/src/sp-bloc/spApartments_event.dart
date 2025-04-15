import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SPApartmentsEvent {}

class ApartmentChanged extends SPApartmentsEvent {
  final Apartment apartment;
  ApartmentChanged(this.apartment);
}

class ApartmentSizeChanged extends SPApartmentsEvent {
  final ApartmentSize apartmentSize;
  ApartmentSizeChanged(this.apartmentSize);
}

