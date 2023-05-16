part of 'signin_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  User? user;
  SignInSuccessState({required this.user});
}

class SignInFailureState extends SignInState {
  final String message;
  const SignInFailureState({
    required this.message,
  });
}
