class FoundationTypeAndFloorsData {
  /// Valesokkelin tyyppi
  FoundationAndFloorType? fakePlinthType;

  // this can still be set to null
  void setFakePlinthType(FoundationAndFloorType? type) {
    fakePlinthType = type;
  }

  /// Rossipohjan tyyppi
  FoundationAndFloorType? baseFloorType;

  void setBaseFloorType(FoundationAndFloorType? type) {
    baseFloorType = type;
  }

  /// Pilariperustuksen tyyppi
  FoundationAndFloorType? pillarFoundationType;

  void setPillarFoundationType(FoundationAndFloorType? type) {
    pillarFoundationType = type;
  }

  /// Ontelolaattoperustuksen tyyppi
  FoundationAndFloorType? cavitySlabType;

  void setCavitySlabType(FoundationAndFloorType? type) {
    cavitySlabType = type;
  }

  /// Perustuksen pinta-ala (m2) - Valesokkeli
  double? fakePlinthSurfaceArea;

  void setFakePlinthSurfaceArea(double value) {
    fakePlinthSurfaceArea = value;
  }

  /// Perustuksen kehämitta (jm) - Valesokkeli
  ///
  /// jm refers to "Juoksumetri"
  double? fakePlinthCircumference;

  void setfakePlinthCircumference(double value) {
    fakePlinthCircumference = value;
  }

  /// Perustuksen pinta-ala (m2) - Rossipohja
  double? baseFloorSurfaceArea;

  void setBaseFloorSurfaceArea(double value) {
    baseFloorSurfaceArea = value;
  }

  /// Perustuksen kehämitta (jm) - Rossipohja
  double? baseFloorCircumference;

  void setBaseFloorCircumference(double value) {
    baseFloorCircumference = value;
  }

  /// Perustuksen pinta-ala (m2) - Matalaperustus
  double? shallowFoundationSurfaceArea;

  void setShallowFoundationSurfaceArea(double value) {
    shallowFoundationSurfaceArea = value;
  }

  /// Perustuksen kehämitta (jm) - Matalaperustus
  double? shallowFoundationCircumference;

  void setShallowFoundationCircumference(double value) {
    shallowFoundationCircumference = value;
  }

  /// Perustuksen pinta-ala (m2) - Pilariperustus
  double? pillarFoundationSurfaceArea;

  void setPillarFoundationSurfaceArea(double value) {
    pillarFoundationSurfaceArea = value;
  }

  /// Perustuksen kehämitta (jm) - Pilariperustus
  double? pillarFoundationCircumference;

  void setPillarFoundationCircumference(double value) {
    pillarFoundationCircumference = value;
  }

  /// Perustuksen pinta-ala (m2) - Ontelolaattaperustus
  double? cavitySlabSurfaceArea;

  void setCavitySlabSurfaceArea(double value) {
    cavitySlabSurfaceArea = value;
  }

  /// Perustuksen kehämitta (jm) - Ontelolaattaperustus
  double? cavitySlabCircumference;

  void setCavitySlabCircumference(double value) {
    cavitySlabCircumference = value;
  }

  /// Perustuksen pinta-ala (m2) - Koko rakennus yhteensä
  double buildingTotalSurfaceArea = 0;

  /// Calculates sum from input values
  void setBuildingTotalSurfaceArea() {
    buildingTotalSurfaceArea = (fakePlinthSurfaceArea ?? 0) +
        (baseFloorSurfaceArea ?? 0) +
        (shallowFoundationSurfaceArea ?? 0) +
        (pillarFoundationSurfaceArea ?? 0) +
        (cavitySlabSurfaceArea ?? 0);
  }

  /// Perustuksen kehämitta (jm) - Koko rakennus yhteensä
  double circumferenceTotal = 0;

  /// Calculates sum from input values
  void setCircumferenceTotal() {
    circumferenceTotal = (fakePlinthCircumference ?? 0) +
        (baseFloorCircumference ?? 0) +
        (shallowFoundationCircumference ?? 0) +
        (pillarFoundationCircumference ?? 0) +
        (cavitySlabCircumference ?? 0);
  }
}

/// User for menu options in [FoundationTypeAndFloorsData]
enum FoundationAndFloorType {
  // Betonivalu
  concreteCasting,
  // Harkko
  ingot,
}
