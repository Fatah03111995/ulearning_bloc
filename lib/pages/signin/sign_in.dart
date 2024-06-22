import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_bloc.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_event.dart';
import 'package:ulearning_bloc/pages/signin/bloc/signin_state.dart';
import 'package:ulearning_bloc/pages/signin/widget/icon_img_container.dart';
import 'package:ulearning_bloc/pages/signin/widget/input_text.dart';
import 'package:ulearning_bloc/themes/textstyles.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  final String iconPath = 'assets/icons';

  @override
  Widget build(BuildContext context) {
    SignInState signInState = context.watch<SignInBloc>().state;
    print(signInState.email);
    print(signInState.password);

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
                      onChanged: (value) => context
                          .read<SignInBloc>()
                          .add(EmailEvent(email: value)),
                      icon: Icons.email,
                    ),
                    InputText(
                      label: 'password',
                      onChanged: (value) => context
                          .read<SignInBloc>()
                          .add(PasswordEvent(password: value)),
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
