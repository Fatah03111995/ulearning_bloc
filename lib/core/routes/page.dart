import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/core/routes/name.dart';
import 'package:ulearning_bloc/pages/aplication/aplication.dart';
import 'package:ulearning_bloc/pages/aplication/bloc/app_bloc.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_bloc.dart';
import 'package:ulearning_bloc/pages/signin/sign_in.dart';
import 'package:ulearning_bloc/pages/signup/bloc/signup_bloc.dart';
import 'package:ulearning_bloc/pages/signup/sign_up.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_bloc/pages/welcome/welcome.dart';

class PageData {
  String path;
  Widget page;
  dynamic bloc;

  PageData({
    required this.path,
    required this.page,
    this.bloc,
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
          page: const SignUpPage(), //const SignUp(),
          bloc: BlocProvider(create: (context) => SignUpBloc() // SignUpBloc(),
              ),
        ),
        PageData(
          path: NameRoutes.aplication,
          page: const Application(),
          bloc: BlocProvider(
            create: (context) => AppBloc(),
          ),
        )
      ];

  static List<BlocProvider> allBlocProvider(BuildContext context) {
    List<BlocProvider> allData = [];
    for (var el in routes) {
      if (el.bloc != null) {
        allData.add(el.bloc);
      }
    }
    return allData;
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      List<PageData> result =
          routes.where((route) => route.path == settings.name).toList();
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (context) => const SignInPage());
  }
}
