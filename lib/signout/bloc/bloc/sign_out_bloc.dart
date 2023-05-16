import 'package:auth_app/repositotry/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  AuthRepository? authRepository;
  SignOutBloc({required this.authRepository}) : super(SignOutInitial()) {
    on<SignOutEvent>((event, emit) async {
      try {
        emit(SignOutLoading());
        var signout = await authRepository?.signOut();
        emit(SignOutSucced());
      } catch (e) {
        emit(SignOutFailed(message: e.toString()));
      }
    });
  }
}
