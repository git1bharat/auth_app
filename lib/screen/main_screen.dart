// import 'package:auth_app/auth/bloc/auth_bloc.dart';
// import 'package:auth_app/auth/bloc/auth_state.dart';

// import 'package:auth_app/screen/signup_wellcome.dart';
// import 'package:auth_app/screen/splashscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthenticationState>(
//         builder: (context, state) {
//       if (State is UnAuthentcateState) {
//         return ();
//       } else if (state is AuthenticateState) {
//         return SignUpWellcome();
//       }

//       return Container();
//     });
//   }
// }
