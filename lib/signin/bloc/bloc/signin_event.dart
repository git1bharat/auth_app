part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];

  get email => null;

  get password => null;
}

class SignInRequest extends SignInEvent {
  late final String? email;
  late final String? password;
  SignInRequest({required this.email, required this.password});
}
