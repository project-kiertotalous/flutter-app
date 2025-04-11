abstract class SPElectricalInstallationsAndHVACEvent {}

class SPElectricalWiresCopperChanged extends SPElectricalInstallationsAndHVACEvent {
  final num? value;
  SPElectricalWiresCopperChanged(this.value);
}

class SPCopperPipesChanged extends SPElectricalInstallationsAndHVACEvent {
  final num? value;
  SPCopperPipesChanged(this.value);
}

class SPPlasticPipesWaterChanged extends SPElectricalInstallationsAndHVACEvent {
  final num? value;
  SPPlasticPipesWaterChanged(this.value);
}

class SPVentilationPipesD200Changed extends SPElectricalInstallationsAndHVACEvent {
  final num? value;
  SPVentilationPipesD200Changed(this.value);
}
