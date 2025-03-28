import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalRoofsEvent {}

class TotalRoofsChanged extends TotalRoofsEvent {
  final TotalRoofs totalRoofs;
  TotalRoofsChanged(this.totalRoofs);
}

class BituminousWaterProofingChanged extends TotalRoofsEvent {
  final bool bituminousWaterProofing;
  BituminousWaterProofingChanged(this.bituminousWaterProofing);
}
