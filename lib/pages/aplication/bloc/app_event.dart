abstract class AppEvent {
  const AppEvent();
}

class ChangeIndex extends AppEvent {
  final int index;

  const ChangeIndex({required this.index});
}
