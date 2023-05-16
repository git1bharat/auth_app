import 'package:auth_app/repositotry/auth_repository.dart';
import 'package:auth_app/repositotry/error_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  AuthRepository authRepository;
  SignInBloc({required this.authRepository}) : super(SignInInitialState()) {
    // some comment
    on<SignInEvent>((event, emit) async {
      try {
        emit(SignInLoadingState());
        var user = await authRepository.signIn(
            email: event.email, password: event.password);
        emit(SignInSuccessState(user: user));
      } on LogInWithEmailAndPasswordFailure catch (e) {
        emit(SignInFailureState(message: e.toString()));
      } catch (e) {
        emit(SignInFailureState(message: "Unknown exception $e"));
      }
    });
  }
}
