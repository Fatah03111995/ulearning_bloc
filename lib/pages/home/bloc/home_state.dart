// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeState {
  final int index;
  const HomeState({this.index = 0});

  HomeState copyWith({
    int? index,
  }) {
    return HomeState(
      index: index ?? this.index,
    );
  }
}
