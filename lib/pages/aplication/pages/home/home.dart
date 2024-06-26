// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_bloc/core/themes/textstyles.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_bloc/pages/aplication/pages/home/bloc/home_event.dart';
import 'package:ulearning_bloc/pages/aplication/widget/app_pageview.dart';
import 'package:ulearning_bloc/pages/aplication/widget/button_category.dart';
import 'package:ulearning_bloc/pages/aplication/widget/course_item.dart';
import 'package:ulearning_bloc/pages/aplication/widget/input_text_app.dart';

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

    return Center(
      child: SizedBox(
        width: 320.w, //width set in here
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 300.w,
                // SliverToBoxAdapter adapt the cild based on the layout of parent,
                // so the set width is ignored
                child: Text(
                  'Hello,',
                  style: TextStyles.mlBold.copyWith(color: Colors.black38),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: 300.w,
                child: Text(
                  'Abdul Fatah',
                  style: TextStyles.lBold.copyWith(color: Colors.black),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10.h),
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10.h),
                width: 200.w,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCategory(
                      label: 'all',
                      isActive: true,
                    ),
                    ButtonCategory(label: 'new'),
                    ButtonCategory(label: 'popular'),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.3,
                ),
                delegate: SliverChildBuilderDelegate(childCount: courses.length,
                    (context, index) {
                  CourseData data = courses[index];
                  return CourseItem(
                    title: data.title,
                    author: data.author,
                    imgAsset: data.img,
                    totalCourse: data.totalCourse,
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<CourseData> courses = const [
  CourseData(
      title: 'Design IOT',
      author: 'Ahmad Fatihin, Si',
      totalCourse: '30',
      img: 'assets/images/iot.jpg'),
  CourseData(
      title: 'Build Driver Online Apps',
      author: 'Abdul Fatah, ST, Si',
      totalCourse: '30',
      img: 'assets/images/ngojeg.jpg'),
  CourseData(
      title: 'Meals Recipe',
      author: 'Rizki, Si',
      totalCourse: '30',
      img: 'assets/images/meals.jpg'),
  CourseData(
      title: 'E Commerce fullstack',
      author: 'ahmad fatihin, Si',
      totalCourse: '30',
      img: 'assets/images/ecommerce.jpg'),
];

class CourseData {
  final String title;
  final String author;
  final String img;
  final String totalCourse;
  const CourseData({
    required this.title,
    required this.author,
    required this.img,
    required this.totalCourse,
  });
}
