import 'package:bloc_clean_architechture/features/user_auth/domain/entity/auth_entity.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_event.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../nav_controller/presentation/screens/home_screen.dart';

class UserAuthScreen extends StatelessWidget {
  UserAuthScreen({super.key});
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          builder: (BuildContext context, state) {
            ///
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            ///
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailText,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    hintText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordText,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var authEntity = AuthEntity(
                      email: emailText.text.trim(),
                      password: passwordText.text.trim(),
                    );
                    BlocProvider.of<AuthBloc>(context)
                        .add(LoginEvent(authEntity));
                  },
                  child: const Text("LogIn"),
                )
              ],
            );
          },
          listener: (BuildContext context, Object? state) {
            if (state is AuthFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.msg),
                ),
              );
            }else if(state is AuthSuccessState){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=>HomeScreen()),(rout)=>false);
            }
          },
        ),
      ),
    );
  }
}
