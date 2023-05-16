import 'package:auth_app/repositotry/auth_repository.dart';
import 'package:auth_app/repositotry/error_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  AuthRepository authRepository;
  SignUpBloc({required this.authRepository}) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      try {
        emit(SignUpLoading());
        print('1111111111');

        var user = await authRepository.signUp(
            email: event.email, password: event.password);
        print('2222222');

        emit(SignUpSuccess(user: user));
      } on SignUpWithEmailAndPasswordFailure catch (e) {
        emit(SignUpFailed(message: e.toString()));
      } catch (e) {
        emit(SignUpFailed(message: 'Something Went Wrong $e'));
      }
    });
  }
}
