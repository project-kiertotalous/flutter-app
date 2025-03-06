/// User input gathered in UI forms is stored here.
class RemovableGroundsData {
  /// Poistettavan alueen pinta-ala (m2)
  double groundSurfaceArea = 0;

  void setGroundSurfaceArea(double value) {
    groundSurfaceArea = value;
  }

  /// Poistettavan alueen syvyys (m)
  double groundDepth = 0;

  void setGroundDepth(double value) {
    groundDepth = value;
  }

  /// Poistettava määrä (m3)
  double removableAmount = 0;

  void setRemovableAmount(double value) {
    removableAmount = value;
  }

  /// Poistettavan puhtaan maan osuus (%)
  /// OR
  /// Puhdas maa poistettavasta maasta (%)
  double removableCleanGroundShare = 0;

  void setRemovableCleanGroundShare(double value) {
    removableCleanGroundShare = value;
  }

  /// Puhdas maa (tonnia)
  double cleanGroundTons = 0;

  void setCleanGroundTons(double value) {
    cleanGroundTons = value;
  }

  /// Saastunut maa (tonnia)
  double contaminatedGroundTons = 0;

  void setContaminatedGroundTons(double value) {
    contaminatedGroundTons = value;
  }

  /// Saastunut maa poistettavasta maasta (%)
  double contaminatedGroundShare = 0;

  void setContaminatedGroundShare(double value) {
    contaminatedGroundShare = value;
  }

  /// Saastunut maa (m3)
  double contaminatedGroundCubicMeters = 0;

  void setContaminatedGroundCubicMeters(double value) {
    contaminatedGroundCubicMeters = value;
  }

  /// Asfaltti alue (m2)
  double asphaltSurfaceArea = 0;

  void setAsphaltSurfaceArea(double value) {
    asphaltSurfaceArea = value;
  }

  /// Asfaltti (tonnia)
  double asphaltTons = 0;

  void setAsphaltTons(double value) {
    asphaltTons = value;
  }

  /// Asfaltti (m3)
  double asphaltCubicMeters = 0;

  void setAsphaltCubicMeters(double value) {
    asphaltCubicMeters = value;
  }

  /// Poistettavan maan kokonaismäärä (tonnia)
  double removableGroundTons = 0;

  void setRemovableGroundTons(double value) {
    removableGroundTons = value;
  }
}
