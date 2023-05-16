import 'package:auth_app/screen/signin_wellcome.dart';

import 'package:auth_app/signin/bloc/bloc/signin_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    final signinbloc = BlocProvider.of<SignInBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Login screen'),
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
            BlocListener<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccessState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SignInWellcome()));
                }
              },
              child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SignInFailureState) {
                  return buildError(state.message);
                } else if (state is SignInSuccessState) {
                  return Container();
                } else {
                  return Container();
                }
              }),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330,
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              hintText: 'Enter Your Email Here'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password Here',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        TextButton(
                            onPressed: () {
                              signinbloc.add(SignInRequest(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text));
                            },
                            child: Text("login")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/signUp/', (route) => false);
                            },
                            child: Text('Not register yet? register here'))
                      ]),
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
