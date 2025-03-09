import 'package:flutter/material.dart';
import 'package:flutter_app/log.dart';
import 'package:stream_mixin/stream_mixin.dart';

class FoundationTypeAndFloorsData with StreamMixin<double> {
  /// Valesokkelin tyyppi
  FoundationAndFloorType fakePlinthType = FoundationAndFloorType.choose;

  // this can still be set to null
  void setFakePlinthType(FoundationAndFloorType type) {
    fakePlinthType = type;
    logger.d('fakePlinthType set to ${fakePlinthType}');
  }

  /// Rossipohjan tyyppi
  FoundationAndFloorType baseFloorType = FoundationAndFloorType.choose;

  void setBaseFloorType(FoundationAndFloorType type) {
    baseFloorType = type;
  }

  /// Pilariperustuksen tyyppi
  FoundationAndFloorType pillarFoundationType = FoundationAndFloorType.choose;

  void setPillarFoundationType(FoundationAndFloorType type) {
    pillarFoundationType = type;
  }

  /// Ontelolaattoperustuksen tyyppi
  FoundationAndFloorType cavitySlabType = FoundationAndFloorType.choose;

  void setCavitySlabType(FoundationAndFloorType type) {
    cavitySlabType = type;
  }

  /// Perustuksen pinta-ala (m2) - Valesokkeli
  double fakePlinthSurfaceArea = 0;

  void setFakePlinthSurfaceArea(double value) {
    fakePlinthSurfaceArea = value;
    calculateSurfaceAreaTotal();
    update(buildingSurfaceAreaTotal);
  }

  /// Perustuksen kehämitta (jm) - Valesokkeli
  ///
  /// jm refers to "Juoksumetri"
  double fakePlinthCircumference = 0;

  void setfakePlinthCircumference(double value) {
    fakePlinthCircumference = value;
    calculateCircumferenceTotal();
    update(circumferenceTotal);
  }

  /// Perustuksen pinta-ala (m2) - Rossipohja
  double baseFloorSurfaceArea = 0;

  void setBaseFloorSurfaceArea(double value) {
    baseFloorSurfaceArea = value;
    calculateSurfaceAreaTotal();
    update(buildingSurfaceAreaTotal);
  }

  /// Perustuksen kehämitta (jm) - Rossipohja
  double baseFloorCircumference = 0;

  void setBaseFloorCircumference(double value) {
    baseFloorCircumference = value;
    calculateCircumferenceTotal();
    update(circumferenceTotal);
  }

  /// Perustuksen pinta-ala (m2) - Matalaperustus
  double shallowFoundationSurfaceArea = 0;

  void setShallowFoundationSurfaceArea(double value) {
    shallowFoundationSurfaceArea = value;
    calculateSurfaceAreaTotal();
    update(buildingSurfaceAreaTotal);
  }

  /// Perustuksen kehämitta (jm) - Matalaperustus
  double shallowFoundationCircumference = 0;

  void setShallowFoundationCircumference(double value) {
    shallowFoundationCircumference = value;
    calculateCircumferenceTotal();
    update(circumferenceTotal);
  }

  /// Perustuksen pinta-ala (m2) - Pilariperustus
  double pillarFoundationSurfaceArea = 0;

  void setPillarFoundationSurfaceArea(double value) {
    pillarFoundationSurfaceArea = value;
    calculateSurfaceAreaTotal();
    update(buildingSurfaceAreaTotal);
  }

  /// Perustuksen kehämitta (jm) - Pilariperustus
  double pillarFoundationCircumference = 0;

  void setPillarFoundationCircumference(double value) {
    pillarFoundationCircumference = value;
    calculateCircumferenceTotal();
    update(circumferenceTotal);
  }

  /// Perustuksen pinta-ala (m2) - Ontelolaattaperustus
  double cavitySlabSurfaceArea = 0;

  void setCavitySlabSurfaceArea(double value) {
    cavitySlabSurfaceArea = value;
    calculateSurfaceAreaTotal();
    update(buildingSurfaceAreaTotal);
  }

  /// Perustuksen kehämitta (jm) - Ontelolaattaperustus
  double cavitySlabCircumference = 0;

  void setCavitySlabCircumference(double value) {
    cavitySlabCircumference = value;
    calculateCircumferenceTotal();
    update(circumferenceTotal);
  }

  /// Perustuksen pinta-ala (m2) - Koko rakennus yhteensä
  double buildingSurfaceAreaTotal = 0;

  double getSurfaceAreaTotal() => buildingSurfaceAreaTotal;

  /// Calculates sum from input values
  void calculateSurfaceAreaTotal() {
    buildingSurfaceAreaTotal = fakePlinthSurfaceArea +
        baseFloorSurfaceArea +
        shallowFoundationSurfaceArea +
        pillarFoundationSurfaceArea +
        cavitySlabSurfaceArea;
  }

  /// Perustuksen kehämitta (jm) - Koko rakennus yhteensä
  double circumferenceTotal = 0;

  double getCircumferenceTotal() => circumferenceTotal;

  /// Calculates sum from input values
  void calculateCircumferenceTotal() {
    circumferenceTotal = fakePlinthCircumference +
        baseFloorCircumference +
        shallowFoundationCircumference +
        pillarFoundationCircumference +
        cavitySlabCircumference;
  }
}

abstract class FormEnum {
  static List<DropdownMenuItem> toList() {
    return [];
  }
}

/// User for menu options in [FoundationTypeAndFloorsData]
enum FoundationAndFloorType implements FormEnum {
  // Valitse
  choose,
  // Betonivalu
  concreteCasting,
  // Harkko
  ingot;

  static List<DropdownMenuItem> toList() {
    List<DropdownMenuItem<FoundationAndFloorType>> list = [];
    for (final type in FoundationAndFloorType.values) {
      list.add(
        DropdownMenuItem<FoundationAndFloorType>(
          value: type,
          child: Text(
            type.toString(),
          ),
        ),
      );
    }
    return list;
  }

  @override
  String toString() {
    switch (this) {
      case choose:
        return "Valitse";
      case concreteCasting:
        return "Betonivalu";
      case ingot:
        return "Harkko";
    }
  }
}
