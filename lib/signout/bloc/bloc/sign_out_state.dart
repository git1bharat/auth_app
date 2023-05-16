part of 'sign_out_bloc.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

class SignOutInitial extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutSucced extends SignOutState {}

class SignOutFailed extends SignOutState {
  String message;
  SignOutFailed({required this.message});
}
