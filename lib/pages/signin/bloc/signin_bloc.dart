import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_event.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
