import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/core/routes/name.dart';
import 'package:ulearning_bloc/global.dart';
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

  PageData({
    required this.path,
    required this.page,
  });
}

class AppRoutes {
  static List<PageData> get routes => [
        PageData(
          path: NameRoutes.initial,
          page: BlocProvider(
            create: (context) => WelcomeBloc(),
            child: const WelcomePage(),
          ),
        ),
        PageData(
          path: NameRoutes.signIn,
          page: BlocProvider(
            create: (context) => SignInBloc(),
            child: const SignInPage(),
          ),
        ),
        PageData(
          path: NameRoutes.register,
          page: BlocProvider(
            create: (context) => SignUpBloc(),
            child: const SignUpPage(),
          ), //const SignUp(),
        ),
        PageData(
          path: NameRoutes.aplication,
          page: BlocProvider(
            create: (context) => AppBloc(),
            child: const Application(),
          ),
        )
      ];

  static List<PageData> getPage(String nameRoutes) {
    return routes.where((route) => route.path == nameRoutes).toList();
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      List<PageData> result = getPage(settings.name ?? '');

      if (result.isNotEmpty) {
        // --------------- MAKE SURE INITIAL ROUTE RUN ONLY IN FIRST INSTALLATION
        if (settings.name == NameRoutes.initial &&
            Global.storagePref.getDeviceFirstOpen()) {
          // ---------------- CONDITION IF USER HAS BEEN LOGGED IN
          bool getIsLogIn = Global.storagePref.getIsLogIn();
          if (getIsLogIn) {
            return MaterialPageRoute(
                builder: (_) => getPage(NameRoutes.aplication).first.page,
                settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => getPage(NameRoutes.signIn).first.page,
              settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => getPage(NameRoutes.signIn).first.page,
        settings: settings);
  }
}
