import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthenticationState {}

class AuthenticateState extends AuthenticationState {
  User? user;
  AuthenticateState({required this.user});
}

class UnAuthentcateState extends AuthenticationState {}
