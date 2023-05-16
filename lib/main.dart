import 'package:auth_app/auth/bloc/auth_bloc.dart';
import 'package:auth_app/signout/bloc/bloc/sign_out_bloc.dart';
import 'package:auth_app/splashscreen.dart';
import 'package:auth_app/repositotry/auth_repository.dart';
import 'package:auth_app/screen/signin_page.dart';
import 'package:auth_app/screen/signup_page.dart';

import 'package:auth_app/signin/bloc/bloc/signin_bloc.dart';
import 'package:auth_app/signup/bloc/signup_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (BuildContext context) =>
                  AuthBloc(authRepository: AuthRepository())),
          BlocProvider<SignUpBloc>(
              create: (BuildContext context) =>
                  SignUpBloc(authRepository: AuthRepository())),
          BlocProvider<SignInBloc>(
              create: (BuildContext context) =>
                  SignInBloc(authRepository: AuthRepository())),
          BlocProvider<SignOutBloc>(
              create: (BuildContext context) =>
                  SignOutBloc(authRepository: AuthRepository())),
        ],
        child: MaterialApp(
          home: const SplashScreen(),
          routes: {
            '/signIn/': (context) => const SignInPage(),
            '/signUp/': (context) => const SignUpPage(),
            '/loginApp/': (context) => const SplashScreen(),
          },
        ));
  }
}
