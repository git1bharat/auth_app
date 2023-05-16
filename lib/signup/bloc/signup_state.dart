part of 'signup_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [User];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  User? user;
  SignUpSuccess({required this.user});
}

class SignUpFailed extends SignUpState {
  final String message;
  SignUpFailed({required this.message});
}
