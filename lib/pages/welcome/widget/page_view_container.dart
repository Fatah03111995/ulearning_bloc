import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class PageViewContainer extends StatelessWidget {
  final String assetsImage;
  final String title;
  final String subTitle;
  final String btnName;
  final void Function(BuildContext) onTap;

  const PageViewContainer(
      {super.key,
      required this.assetsImage,
      required this.title,
      required this.subTitle,
      required this.btnName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          SizedBox(
              height: 345.h,
              width: 345.w,
              child: Image.asset(
                assetsImage,
                alignment: Alignment.bottomCenter,
              )),
          Container(
            width: 375.w,
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyles.mlBold,
            ),
          ),
          Container(
              width: 375.w,
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Text(subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyles.sm.copyWith(color: Colors.black54))),
          GestureDetector(
            onTap: () {
              onTap(context);
            },
            child: Container(
              width: 375.w,
              height: 50.h,
              margin: EdgeInsets.only(top: 30.h, right: 25.w, left: 25.w),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 5))
                  ]),
              child: Center(
                child: Text(
                  btnName,
                  style: TextStyles.smBold.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
