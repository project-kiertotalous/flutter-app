import 'package:flutter_app/src/data/form_data_container.dart';
import 'package:pluto_grid/pluto_grid.dart';

class RemovableGroundsData implements FormDataContainer {
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

  @override
  void updateValue(PlutoGridOnChangedEvent event) {
    final pair = [event.columnIdx, event.rowIdx];
    final newValue = event.value;
    switch (pair) {
      case [1, 0]:
        groundSurfaceArea = newValue;
      case [1, 1]:
        groundDepth = newValue;
      case [1, 2]:
        removableAmount = newValue;
      case [1, 3]:
        removableCleanGroundShare = newValue;
      case [1, 4]:
        cleanGroundTons = newValue;
      case [1, 5]:
        contaminatedGroundTons = newValue;
      case [1, 6]:
        contaminatedGroundCubicMeters = newValue;
      case [1, 7]:
        asphaltSurfaceArea = newValue;
      case [1, 8]:
        asphaltTons = newValue;
      case [1, 9]:
        asphaltCubicMeters = newValue;
    }
  }
}
