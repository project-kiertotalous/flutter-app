abstract class FoundationsEvent {
  final num value;
  FoundationsEvent(this.value);
}

class CrawlSpaceAreaChanged extends FoundationsEvent {
  CrawlSpaceAreaChanged(super.value);
}

class FalsePlinthAreaChanged extends FoundationsEvent {
  FalsePlinthAreaChanged(super.value);
}

class ShallowAreaChanged extends FoundationsEvent {
  ShallowAreaChanged(super.value);
}

class PillarAreaChanged extends FoundationsEvent {
  PillarAreaChanged(super.value);
}

class HollowCoreSlabAreaChanged extends FoundationsEvent {
  HollowCoreSlabAreaChanged(super.value);
}

class CrawlSpaceCircumferenceChanged extends FoundationsEvent {
  CrawlSpaceCircumferenceChanged(super.value);
}

class FalsePlinthCircumferenceChanged extends FoundationsEvent {
  FalsePlinthCircumferenceChanged(super.value);
}

class ShallowCircumferenceChanged extends FoundationsEvent {
  ShallowCircumferenceChanged(super.value);
}

class PillarCircumferenceChanged extends FoundationsEvent {
  PillarCircumferenceChanged(super.value);
}

class HollowCoreSlabCircumferenceChanged extends FoundationsEvent {
  HollowCoreSlabCircumferenceChanged(super.value);
}
