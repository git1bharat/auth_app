import 'package:auth_app/repositotry/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      try {
        User? user;

        emit(AuthenticateState(user: user));
        var issignedin = await authRepository.isSignedIn();
        emit(UnAuthentcateState());
      } catch (e) {}
    });
  }
}
