import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //------------------- DRAWER HEADER
          Container(
            padding: EdgeInsets.fromLTRB(16.w, kToolbarHeight, 16.w, 30.h),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                ),
              ),
            ),
            child: Column(children: [
              _profilePict(),
              SizedBox(height: 10.h),
              Text(
                'Abdul Fatah',
                style: TextStyles.m,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _localCard(
                    title: 'My Courses',
                    icon: Icons.videocam_outlined,
                    onTap: () {},
                  ),
                  const VerticalDivider(
                    color: Colors.red,
                    thickness: 3,
                  ),
                  _localCard(
                    title: 'Buy Courses',
                    icon: Icons.shopping_cart_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ]),
          ),
          // ------------------------ DRAWER HEADER END
          SizedBox(height: 20.h),
          SizedBox(
            height: 350.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ------------------- MENU
                Column(
                  children: [
                    _menuItem(title: 'Rank A+', icon: Icons.star, onTap: () {}),
                    _menuItem(
                        title: 'Settings', icon: Icons.settings, onTap: () {}),
                    _menuItem(
                        title: 'Payment Details',
                        icon: Icons.payment,
                        onTap: () {}),
                    _menuItem(
                        title: 'Achievment',
                        icon: Icons.military_tech,
                        onTap: () {}),
                    _menuItem(
                        title: 'Love', icon: Icons.favorite, onTap: () {}),
                    _menuItem(
                        title: 'Learning Reminders',
                        icon: Icons.schedule,
                        onTap: () {}),
                  ],
                ),
                //--------------------------- MENU END
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.w, horizontal: 30.w),
                  child: Text('v 1.0 u-learning.fatah.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
      {required String title,
      required IconData icon,
      required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 30.w),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.w,
              color: Colors.blue[900],
            ),
            SizedBox(width: 10.h),
            Text(
              title,
              style: TextStyles.sm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _localCard({
    required IconData icon,
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            border: Border.all(color: Colors.black38)),
        child: Column(children: [
          Icon(
            icon,
            color: Colors.blue[900],
          ),
          SizedBox(height: 5.h),
          Text(
            title,
            style: TextStyles.sm,
          ),
        ]),
      ),
    );
  }

  Widget _profilePict() {
    return SizedBox(
      width: 95.w,
      height: 95.w,
      child: Stack(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/default.jpeg',
              width: 95.w,
              height: 95.w,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.edit,
              color: Colors.blue[900],
            ),
          )
        ],
      ),
    );
  }
}
