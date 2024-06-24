import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/pages/aplication/bloc/app._state.dart';
import 'package:ulearning_bloc/pages/aplication/bloc/app_bloc.dart';
import 'package:ulearning_bloc/pages/aplication/bloc/app_event.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppBloc>().state;

    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Text('Main Aplication'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          context.read<AppBloc>().add(ChangeIndex(index: index));
        },
        iconSize: 24.sp,
        currentIndex: appState.index,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black45,
        items: [
          _bottomNavItem(label: 'home', icon: Icons.home),
          _bottomNavItem(label: 'search', icon: Icons.search),
          _bottomNavItem(label: 'course', icon: Icons.play_arrow),
          _bottomNavItem(label: 'chat', icon: Icons.chat),
          _bottomNavItem(label: 'profile', icon: Icons.person),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon),
      activeIcon: Icon(
        icon,
        color: Colors.blue[800],
        shadows: [
          Shadow(
            color: Colors.grey.withOpacity(0.6),
            offset: const Offset(1, 3),
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}
