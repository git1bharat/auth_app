import 'package:flutter/material.dart';

class SignUpWellcome extends StatefulWidget {
  const SignUpWellcome({super.key});

  @override
  State<SignUpWellcome> createState() => _SignUpWellcomeState();
}

class _SignUpWellcomeState extends State<SignUpWellcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SignUp Wellcome'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'SignUp Sucessfull',
                  style: TextStyle(fontSize: 40, color: Colors.pink),
                ),
              ),
              Center(
                child: FloatingActionButton(
                    child: const Center(child: Text('Login Here')),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/signIn/', (route) => false);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
