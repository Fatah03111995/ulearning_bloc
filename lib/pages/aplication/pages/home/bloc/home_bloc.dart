import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/bloc/home_event.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeChangeIndexEvent>(
      (event, emit) {
        emit(state.copyWith(index: event.index));
      },
    );
  }
}
