import 'package:bloc_clean_architechture/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/nav_controller/presentation/bloc/navigate_bloc.dart';
import 'features/user_auth/presentation/screens/user_auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (ctx) => AuthBloc(),
        ),
        BlocProvider(create: (_)=>NavigateBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  UserAuthScreen(),
      ),
    );
  }
}
