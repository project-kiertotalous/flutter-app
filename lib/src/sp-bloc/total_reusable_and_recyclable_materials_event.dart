import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {}

class SmallPropertiesExcavationAreaChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertiesExcavationArea excavationArea;
  SmallPropertiesExcavationAreaChanged(this.excavationArea);
}

class SmallPropertiesFoundationChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertiesFoundation foundation;
  SmallPropertiesFoundationChanged(this.foundation);
}

class SmallPropertyInnerDoorsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyInnerDoors innerDoors;
  SmallPropertyInnerDoorsChanged(this.innerDoors);
}

class SmallPropertyOuterDoorsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyOuterDoors outerDoors;
  SmallPropertyOuterDoorsChanged(this.outerDoors);
}

class SmallPropertyWindowsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyWindows windows;
  SmallPropertyWindowsChanged(this.windows);
}

class SmallPropertiesReusableAndRecyclableMaterialsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertiesReusableAndRecyclableMaterials
      reusableAndRecyclableMaterials;
  SmallPropertiesReusableAndRecyclableMaterialsChanged(
      this.reusableAndRecyclableMaterials);
}
