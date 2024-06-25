import 'package:bloc/bloc.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_event.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(state.copyWith(page: event.page));
    });
  }

  @override
  Future<void> close() {
    print('Welcome Bloc CLOSE');
    return super.close();
  }

  @override
  void onEvent(WelcomeEvent event) {
    print(event.toString());
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error.toString());
    super.onError(error, stackTrace);
  }

  @override
  void onChange(Change<WelcomeState> change) {
    print(change.toString());
    super.onChange(change);
  }

  @override
  void onTransition(Transition<WelcomeEvent, WelcomeState> transition) {
    print(transition.toString());
    super.onTransition(transition);
  }
}
