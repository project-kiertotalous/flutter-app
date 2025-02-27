import 'package:pluto_grid/pluto_grid.dart';

/// This class is meant to be implemented by data container classes
///  that hold form values.
abstract class FormDataContainer {
  /// Updates value of a class attribute according to
  /// [PlutoGridOnChangedEvent.columnIdx] and [PlutoGridOnChangedEvent.rowIdx]
  /// to that of [PlutoGridOnChangedEvent.value]
  void updateValue(PlutoGridOnChangedEvent event) {}
}
