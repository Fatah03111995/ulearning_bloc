import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/bloc/home_event.dart';
import 'package:ulearning_bloc/pages/aplication/widget/app_pageview.dart';
import 'package:ulearning_bloc/pages/aplication/widget/input_text_app.dart';
import 'package:ulearning_bloc/pages/aplication/widget/topnav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String imagePath = 'assets/images';
  @override
  Widget build(BuildContext context) {
    final List<Widget> pageViewItems = [
      AppPageview(
        title: 'Mastering Adobe Illustrator in 3 days 2024',
        author: 'Panda Merah, Si',
        imgAsset: '$imagePath/AdobeIllustrator.jpeg',
      ),
      AppPageview(
        title: 'Visual Design from Zero to Hero',
        author: 'Abdul Fatah, Si',
        imgAsset: '$imagePath/VisualDesigner.jpg',
      ),
      AppPageview(
        title: 'Work With AWS Cloud',
        author: 'Rizki, Si',
        imgAsset: '$imagePath/AWSCloud.jpg',
      ),
    ];

    return TopNavBar(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              width: 300.w,
              child: Text(
                'Hello,',
                style: TextStyles.mlBold.copyWith(color: Colors.black38),
              ),
            ),
            SizedBox(
              width: 300.w,
              child: Text(
                'Abdul Fatah',
                style: TextStyles.lBold.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 300.w,
              child: Row(
                children: [
                  Expanded(
                    child: InputTextApp(
                      hint: 'Search Your Course',
                      icon: Icons.search,
                      onChanged: (value) {
                        // ------------------------- DO SOMETHING HERE
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 40.h,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(10.w)),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 300.w,
              height: 180.h,
              child: Builder(builder: (context) {
                return PageView(
                  onPageChanged: (value) {
                    context
                        .read<HomeBloc>()
                        .add(HomeChangeIndexEvent(index: value));
                  },
                  children: pageViewItems,
                );
              }),
            ),
            SizedBox(
              width: 300.w,
              child: Builder(builder: (context) {
                return DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: pageViewItems.length,
                  position: context.watch<HomeBloc>().state.index,
                  decorator: DotsDecorator(
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w)),
                      size: Size(5.w, 5.w),
                      activeSize: Size(12.w, 5.w),
                      activeColor: Colors.blue[900]),
                );
              }),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 300.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Your Course',
                    style: TextStyles.smBold,
                  ),
                  GestureDetector(
                    onTap: () {
                      // -------------------- DO SOMETHING HERE
                    },
                    child: Text(
                      'See All',
                      style: TextStyles.s.copyWith(color: Colors.black45),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100.w,
            )
          ],
        ),
      )),
    );
  }
}
