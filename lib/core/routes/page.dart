import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/core/routes/name.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_bloc.dart';
import 'package:ulearning_bloc/pages/signin/sign_in.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_bloc/pages/welcome/welcome.dart';

class PageData {
  String path;
  Widget page;
  dynamic bloc;

  PageData({
    required this.path,
    required this.page,
    required this.bloc,
  });
}

class AppRoutes {
  static List<PageData> get routes => [
        PageData(
          path: NameRoutes.initial,
          page: const WelcomePage(),
          bloc: BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
        ),
        PageData(
          path: NameRoutes.signIn,
          page: const SignInPage(),
          bloc: BlocProvider(
            create: (context) => SignInBloc(),
          ),
        ),
        PageData(
          path: NameRoutes.register,
          page: const SignInPage(), //const SignUp(),
          bloc: BlocProvider(create: (context) => SignInBloc() // SignUpBloc(),
              ),
        ),
      ];
}
