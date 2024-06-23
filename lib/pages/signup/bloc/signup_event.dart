// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignUpEvent {
  const SignUpEvent();
}

class UserNameEvent extends SignUpEvent {
  final String userName;
  const UserNameEvent({
    required this.userName,
  });
}

class EmailEvent extends SignUpEvent {
  final String email;
  const EmailEvent({
    required this.email,
  });
}

class PasswordEvent extends SignUpEvent {
  final String password;
  const PasswordEvent({
    required this.password,
  });
}

class ConfirmPasswordEvent extends SignUpEvent {
  final String confirmPassword;
  const ConfirmPasswordEvent({
    required this.confirmPassword,
  });
}
