// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpState {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  String toString() {
    return 'SignUpState(userName: $userName, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }
}
