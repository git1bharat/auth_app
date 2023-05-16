import 'package:auth_app/signout/bloc/bloc/sign_out_bloc.dart';
import 'package:auth_app/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signoutbloc = BlocProvider.of<SignOutBloc>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wellcome'),
        ),
        body: BlocListener<SignOutBloc, SignOutState>(
          listener: (context, state) {
            if (state is SignOutSucced) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SplashScreen()));
            }
          },
          child: BlocBuilder<SignOutBloc, SignOutState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'wellcome to Your account',
                        style: TextStyle(fontSize: 50, color: Colors.pink),
                      ),
                    ),
                    Center(
                      child: FloatingActionButton(
                          child: const Text('LogOut'),
                          onPressed: () {
                            signoutbloc.add(SignOutButtonPressed());
                          }),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
