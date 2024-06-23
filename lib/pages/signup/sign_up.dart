import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/services/user_connection.dart';
import 'package:ulearning_bloc/pages/signin/sign_in.dart';
import 'package:ulearning_bloc/pages/signup/widget/widget.dart';
import 'package:ulearning_bloc/pages/signup/bloc/bloc.dart';
import 'package:ulearning_bloc/themes/textstyles.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Sign Up',
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
              Text(
                'Sign Up with Your Email',
                style: TextStyles.sm.copyWith(color: Colors.black45),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 345.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputText(
                      label: 'User Name',
                      onChanged: (value) => context
                          .read<SignUpBloc>()
                          .add(UserNameEvent(userName: value)),
                      icon: Icons.person,
                    ),
                    InputText(
                      label: 'e-mail',
                      onChanged: (value) => context
                          .read<SignUpBloc>()
                          .add(EmailEvent(email: value)),
                      icon: Icons.email,
                    ),
                    InputText(
                      label: 'password',
                      onChanged: (value) => context
                          .read<SignUpBloc>()
                          .add(PasswordEvent(password: value)),
                      icon: Icons.lock,
                      isVisible: false,
                    ),
                    InputText(
                      label: 'confirm password',
                      onChanged: (value) => context
                          .read<SignUpBloc>()
                          .add(ConfirmPasswordEvent(confirmPassword: value)),
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
                  'with press register button, you have already agree with all terms and condition',
                  style: TextStyles.s,
                ),
              ),
              SizedBox(height: 50.h),
              ButtonSignInPage(
                  txt: 'Register',
                  onTap: () async {
                    SignUpState signInState = context.read<SignUpBloc>().state;
                    await UserConnection.register(
                            email: signInState.email,
                            password: signInState.password)
                        .then((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
