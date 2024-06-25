abstract class HomeEvent {
  const HomeEvent();
}

class HomeChangeIndexEvent extends HomeEvent {
  final int index;
  const HomeChangeIndexEvent({required this.index});
}
