part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  final String email;
  final String password;
  final Status status;

  const SignInState({
    required this.email,
    required this.password,
    required this.status,
  });

  SignInState copyWith({
    String? email,
    String? password,
    Status? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  factory SignInState.initial() {
    return const SignInState(
      email: '',
      password: '',
      status: Status.initial,
    );
  }
}
