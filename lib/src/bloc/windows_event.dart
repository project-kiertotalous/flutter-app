abstract class WindowsEvent {}

class WindowsAreaChanged extends WindowsEvent {
  final double windowArea;

  WindowsAreaChanged(this.windowArea);
}

class WindowsHeightChanged extends WindowsEvent {
  final double windowHeight;

  WindowsHeightChanged(this.windowHeight);
}

// You can add more events here as needed (e.g., for materials, window types, etc.)
