import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconImgContainer extends StatelessWidget {
  final String pathImage;
  final void Function() onTap;

  const IconImgContainer({
    super.key,
    required this.pathImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      padding: EdgeInsets.all(5.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(158, 158, 158, 0.1),
      ),
      child: Image.asset(
        alignment: Alignment.center,
        pathImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
