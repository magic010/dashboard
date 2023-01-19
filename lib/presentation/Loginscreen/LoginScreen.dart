import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/cubits/login/login_cubit.dart';
import '../../helpers/CacheHelper.dart';
import '../../helpers/myApplication.dart';
import '../Dashboard/DashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final emailText = TextEditingController();
final passwordText = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Login Screen'),
          ),
          body: Center(
            child: Form(
              key: _formKey,
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    if (state is LoginSuccess) {
                      CacheHelper.saveToShared('token', state.token).then(
                          (value) => MyApplication.navigateToRemove(
                              context, const DashboardScreen()));
                      // print(CacheHelper.getToken("token"));

                    }
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 50.0,
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Login Screen'),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          controller: emailText,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          controller: passwordText,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<LoginCubit>().userLogin(
                              email: "mostafa@gmail.com", password: "123456");
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  );
                },
              ),
            ),
          )),
    );
  }
}
