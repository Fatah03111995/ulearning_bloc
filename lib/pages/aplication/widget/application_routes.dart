import 'package:flutter/material.dart';
import 'package:ulearning_bloc/pages/aplication/pages/chat/chat.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/home.dart';
import 'package:ulearning_bloc/pages/aplication/pages/profile/profile.dart';
import 'package:ulearning_bloc/pages/aplication/pages/search/search.dart';
import 'package:ulearning_bloc/pages/aplication/pages/your_course/your_course.dart';

class ApplicationRoutes {
  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    YourCourse(),
    ChatPage(),
    ProfilePage(),
  ];

  Widget getPage(int index) => _pages[index];
}
