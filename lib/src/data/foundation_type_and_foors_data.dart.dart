class FoundationTypeAndFloorsData {
  /// Perustuksen pinta-ala (m2) - Valesokkeli
  double? fakePlinthSurfaceArea;

  /// Perustuksen kehämitta (jm) - Valesokkeli
  ///
  /// jm refers to "Juoksumetri"
  double? fakePlinthCircumference;

  /// Perustuksen pinta-ala (m2) - Rossipohja
  double? baseFloorSurfaceArea;

  /// Perustuksen kehämitta (jm) - Rossipohja
  double? baseFloorCircumference;

  /// Perustuksen pinta-ala (m2) - Matalaperustus
  double? shallowFoundationSurfaceArea;

  /// Perustuksen kehämitta (jm) - Matalaperustus
  double? shallowFoundationCircumference;

  /// Perustuksen pinta-ala (m2) - Pilariperustus
  double? pillarFoundationSurfaceArea;

  /// Perustuksen kehämitta (jm) - Pilariperustus
  double? pillarFoundationCircumference;

  /// Perustuksen pinta-ala (m2) - Ontelolaattaperustus
  double? cavitySlabSurfaceArea;

  /// Perustuksen kehämitta (jm) - Ontelolaattaperustus
  double? cavitySlabCircumference;

  /// Perustuksen pinta-ala (m2) - Koko rakennus yhteensä
  double? buildingTotalSurfaceArea;

  /// Perustuksen kehämitta (jm) - Koko rakennus yhteensä
  double? circumferenceTotal;

  // TODO: add update function
}
