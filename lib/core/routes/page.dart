import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/core/routes/name.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_bloc.dart';
import 'package:ulearning_bloc/pages/signin/sign_in.dart';
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
          page: const SignUpPage(), //const SignUp(),
          bloc: BlocProvider(create: (context) => SignInBloc() // SignUpBloc(),
              ),
        ),
      ];

  static List<BlocProvider> get allBlocProvider {
    return List.generate(routes.length, (index) {
      return routes[index].bloc;
    });
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      List<PageData> result =
          routes.where((route) => route.path == settings.name).toList();
      if (result.isNotEmpty) {
        print('valid route ${settings.name}');
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }
    print('invalid ${settings.name}');
    return MaterialPageRoute(builder: (context) => const SignInPage());
  }
}
