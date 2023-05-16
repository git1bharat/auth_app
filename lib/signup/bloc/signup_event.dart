part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];

  get email => null;

  get password => null;
}

class SignUpRequested extends SignUpEvent {
  final String? email;
  final String? password;
  const SignUpRequested({required this.email, required this.password});
  
}
