import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ulearning_bloc/pages/home/home.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_event.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WelcomeState welcomeState = context.watch<WelcomeBloc>().state;
    String imageAsset = 'assets/images';

    List<Widget> listPageView = [
      _pageViewContainer(
        title: 'First See Learning',
        subTitle: 'Forget about for of a papaer, all knowledge in on learning',
        assetsImage: '$imageAsset/learning_online.png',
        btnName: 'NEXT',
      ),
      _pageViewContainer(
        title: 'Connect with Overyone',
        subTitle: 'Always keep in touh with your tutor and friend',
        assetsImage: '$imageAsset/meeting.png',
        btnName: 'NEXT',
      ),
      _pageViewContainer(
          title: 'Always Fascinated Lesson',
          subTitle: 'Anywhere, anytime',
          assetsImage: '$imageAsset/understanding.png',
          btnName: 'GET STARTED'),
    ];

    return Scaffold(
        body: SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
              controller: pageController,
              onPageChanged: (value) {
                welcomeState.page = value.toDouble();
                context.read<WelcomeBloc>().add(WelcomeEvent());
              },
              children: listPageView),
          Positioned(
              bottom: 100.h,
              child: DotsIndicator(
                dotsCount: listPageView.length,
                position: welcomeState.page.toInt(),
                decorator: const DotsDecorator(
                  activeColor: Colors.blue,
                  activeSize: Size(20, 10),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }

  Widget _pageViewContainer({
    required String assetsImage,
    required String title,
    required String subTitle,
    required String btnName,
  }) {
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
              style: GoogleFonts.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              width: 375.w,
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54),
              )),
          GestureDetector(
            onTap: () {
              int welcomeStatePage =
                  context.read<WelcomeBloc>().state.page.toInt() + 1;

              if (welcomeStatePage < 3) {
                pageController.animateToPage(welcomeStatePage,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
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
                  style:
                      GoogleFonts.poppins(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
