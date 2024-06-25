import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavBar extends StatelessWidget {
  final Widget? body;
  const TopNavBar({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.6),
        actions: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[900],
            ),
            margin: EdgeInsets.only(right: 25.w),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: Column(children: [
          Icon(Icons.person),
          Icon(Icons.settings),
        ]),
      ),
      body: body,
    );
  }
}
