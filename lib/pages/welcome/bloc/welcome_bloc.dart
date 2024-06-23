import 'package:bloc/bloc.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_event.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(state.copyWith(page: event.page));
    });
  }
}
