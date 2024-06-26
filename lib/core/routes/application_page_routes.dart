import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/pages/chat/chat.dart';
import 'package:ulearning_bloc/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_bloc/pages/home/home.dart';
import 'package:ulearning_bloc/pages/search/search.dart';
import 'package:ulearning_bloc/pages/your_course/your_course.dart';

class ApplicationRoutes {
  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomePage(),
    ),
    const SearchPage(),
    const YourCourse(),
    const ChatPage(),
  ];

  Widget getPage(int index) => _pages[index];
}
