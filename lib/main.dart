import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/routes/name.dart';
import 'package:ulearning_bloc/core/routes/page.dart';
import 'package:ulearning_bloc/firebase_options.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_bloc.dart';
import 'package:ulearning_bloc/pages/signup/bloc/bloc.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_bloc/pages/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: AppRoutes.allBlocProvider,
      child: const ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: NameRoutes.initial,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
