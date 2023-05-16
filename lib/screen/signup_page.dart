import 'package:auth_app/screen/signup_wellcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signup/bloc/signup_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupbloc = BlocProvider.of<SignUpBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Register Screen'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/loginApp/', (route) => false);
            },
          ),
        ),
        body: Column(
          children: [
            BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SignUpWellcome()));
                }
              },
              child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                if (State is SignUpLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SignUpFailed) {
                  return buildError(state.message);
                } else if (state is SignUpSuccess) {
                  return Container();
                }
                return Container();
              }),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: emailcontroller,
                      decoration:
                          InputDecoration(hintText: 'Enter Your Email Here'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: passwordcontroller,
                      decoration:
                          InputDecoration(hintText: 'Enter Your Password Here'),
                      keyboardType: TextInputType.number,
                    ),
                    TextButton(
                        onPressed: () {
                          signupbloc.add(SignUpRequested(
                              email: emailcontroller.text,
                              password: passwordcontroller.text));
                        },
                        child: const Text('signUp')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/signIn/', (route) => false);
                        },
                        child: const Text('Already register? Login here')),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

Widget buildError(String message) {
  return Text(
    message,
    style: TextStyle(color: Colors.red),
  );
}
