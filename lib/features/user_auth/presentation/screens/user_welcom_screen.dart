import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user_auth/presentation/screens/user_auth_screen.dart';
class UserWelcomeScreen extends StatelessWidget {
  const UserWelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          builder: (ctx, state) {
            ///
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            ///
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to home screen"),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          },
          listener: (BuildContext context, state) {
            ///
            if (state is AuthInitState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => UserAuthScreen()),
                      (rout) => false);
            }
            ///
          },
        ),
      ),
    );
  }
}
