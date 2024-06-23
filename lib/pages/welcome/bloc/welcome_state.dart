// ignore_for_file: public_member_api_docs, sort_constructors_first
class WelcomeState {
  final double page;

  const WelcomeState({
    this.page = 0,
  });

  WelcomeState copyWith({
    double? page,
  }) {
    return WelcomeState(
      page: page ?? this.page,
    );
  }
}
