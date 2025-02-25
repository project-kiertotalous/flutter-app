class RemovableGroundsData {
  /// Poistettavan alueen pinta-ala (m2)
  double groundSurfaceArea = 0;

  /// Poistettavan alueen syvyys (m)
  double groundDepth = 0;

  /// Poistettava määrä (m3)
  double removableAmount = 0;

  /// Poistettavan puhtaan maan osuus (%)
  double removableCleanGroundShare = 0;

  /// Puhdas maa (tonnia)
  double cleanGroundTons = 0;

  /// Saastunut maa (tonnia)
  double contaminatedGroundTons = 0;

  /// Saastunut maa (m3)
  double contaminatedGroundCubicMeters = 0;

  /// Asfaltti alue (m2)
  double asphaltSurfaceArea = 0;

  /// Asfaltti (tonnia)
  double asphaltTons = 0;

  /// Asfaltti (m3)
  double asphaltCubicMeters = 0;

  void updateValue(int column, int row, dynamic value) {
    final pair = [column, row];
    switch (pair) {
      case [1, 0]:
        groundSurfaceArea = value;
      case [1, 1]:
        groundDepth = value;
      case [1, 2]:
        removableAmount = value;
      case [1, 3]:
        removableCleanGroundShare = value;
      case [1, 4]:
        cleanGroundTons = value;
      case [1, 5]:
        contaminatedGroundTons = value;
      case [1, 6]:
        contaminatedGroundCubicMeters = value;
      case [1, 7]:
        asphaltSurfaceArea = value;
      case [1, 8]:
        asphaltTons = value;
      case [1, 9]:
        asphaltCubicMeters = value;
    }
  }
}
