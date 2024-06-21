import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/pages/signin/widget/icon_img_container.dart';
import 'package:ulearning_bloc/pages/signin/widget/input_text.dart';
import 'package:ulearning_bloc/themes/textstyles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String iconPath = 'assets/icons';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Sign In',
          style: TextStyles.m,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70.h),
              SizedBox(
                width: 250.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconImgContainer(
                        onTap: () {}, pathImage: '$iconPath/google.png'),
                    IconImgContainer(
                        onTap: () {}, pathImage: '$iconPath/apple.png'),
                    IconImgContainer(
                        onTap: () {}, pathImage: '$iconPath/facebook.png'),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'or Sign in With Your Email Account',
                style: TextStyles.sm.copyWith(color: Colors.black45),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 345.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputText(
                      label: 'e-mail',
                      controller: emailController,
                      icon: Icons.email,
                    ),
                    InputText(
                      label: 'password',
                      controller: passwordController,
                      icon: Icons.lock,
                      isVisible: false,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 300.w,
                child: Text(
                  'forgot password ?',
                  style: TextStyles.s,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.h),
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyles.smBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue,
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyles.smBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
