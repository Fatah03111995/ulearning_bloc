import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/pages/aplication/bloc/app._state.dart';
import 'package:ulearning_bloc/pages/aplication/bloc/app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<ChangeIndex>(_onChangeHandler);
  }

  void _onChangeHandler(ChangeIndex event, Emitter<AppState> emit) {
    emit(AppState(index: event.index));
  }
}
