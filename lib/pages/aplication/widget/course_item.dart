import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class CourseItem extends StatelessWidget {
  final String title;
  final String author;
  final String totalCourse;
  final String imgAsset;
  const CourseItem({
    super.key,
    required this.title,
    required this.author,
    required this.totalCourse,
    required this.imgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          image: DecorationImage(
            image: AssetImage(imgAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: Colors.black.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.smBold.copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                author,
                style: TextStyles.s.copyWith(color: Colors.white),
              ),
              Text(
                '$totalCourse lessons',
                style: TextStyles.s.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
