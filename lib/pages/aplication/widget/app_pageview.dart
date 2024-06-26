import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class AppPageview extends StatelessWidget {
  final String imgAsset;
  final String title;
  final String author;

  const AppPageview({
    super.key,
    required this.title,
    required this.author,
    required this.imgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.w,
        height: 180.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgAsset),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: Container(
          // height: 50.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30.w)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.smBold.copyWith(color: Colors.white),
                ),
              ),
              Text(
                author,
                style: TextStyles.sm.copyWith(color: Colors.amber),
              )
            ],
          ),
        ));
  }
}
