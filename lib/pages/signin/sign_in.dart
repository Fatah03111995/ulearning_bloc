import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/routes/name.dart';
import 'package:ulearning_bloc/core/services/user_connection.dart';
import 'package:ulearning_bloc/pages/signin/bloc/bloc.dart';
import 'package:ulearning_bloc/pages/signin/widget/widget.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  final String iconPath = 'assets/icons';

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
              SizedBox(height: 70.h),
              ButtonSignInPage(
                  txt: 'Sign In',
                  onTap: () async {
                    SignInState signInState = context.read<SignInBloc>().state;
                    UserConnection.loginByEmail(
                            email: signInState.email,
                            password: signInState.password)
                        .then((value) => Navigator.pushNamed(
                            context, NameRoutes.aplication));
                  }),
              ButtonSignInPage(
                onTap: () {
                  Navigator.pushNamed(context, NameRoutes.register);
                },
                txt: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
