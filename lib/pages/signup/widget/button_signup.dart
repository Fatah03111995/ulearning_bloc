import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class ButtonSignInPage extends StatelessWidget {
  final String txt;
  final void Function() onTap;
  const ButtonSignInPage({
    required this.txt,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 300.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.lightBlue,
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyles.smBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
