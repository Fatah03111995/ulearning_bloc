import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/pages/signin/sign_in.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_event.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_state.dart';
import 'package:ulearning_bloc/pages/welcome/widget/page_view_container.dart';

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
      PageViewContainer(
        title: 'First See Learning',
        subTitle: 'Forget about for of a papaer, all knowledge in on learning',
        assetsImage: '$imageAsset/learning_online.png',
        btnName: 'NEXT',
        onTap: _onTap,
      ),
      PageViewContainer(
        title: 'Connect with Overyone',
        subTitle: 'Always keep in touh with your tutor and friend',
        assetsImage: '$imageAsset/meeting.png',
        btnName: 'NEXT',
        onTap: _onTap,
      ),
      PageViewContainer(
          title: 'Always Fascinated Lesson',
          subTitle: 'Anywhere, anytime',
          assetsImage: '$imageAsset/understanding.png',
          btnName: 'GET STARTED',
          onTap: _onTap)
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

  void _onTap(BuildContext context) {
    int welcomeStatePage = context.read<WelcomeBloc>().state.page.toInt() + 1;

    if (welcomeStatePage < 3) {
      pageController.animateToPage(welcomeStatePage,
          duration: const Duration(seconds: 1), curve: Curves.decelerate);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignInPage()));
    }
  }
}
