// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({String? email, String? password}) => SignInState(
      email: email ?? this.email, password: password ?? this.password);

  @override
  String toString() => 'SignInState(email: $email, password: $password)';
}
