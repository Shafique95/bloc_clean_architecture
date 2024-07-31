import 'package:bloc_clean_architechture/features/nav_controller/presentation/bloc/navigate_bloc.dart';
import 'package:bloc_clean_architechture/features/nav_controller/presentation/bloc/navigate_event.dart';
import 'package:bloc_clean_architechture/features/nav_controller/presentation/bloc/navigate_state.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_clean_architechture/features/user_auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../flutter_stream/presentation/sereens/StreamUi.dart';
import '../../../counter/presentation/screen/counter_home_screen.dart';
import '../../../todoey/presentation/screens/todoey_home_screen.dart';
import '../../../user_auth/presentation/screens/user_welcom_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigateBloc, NavigateState>(
        builder: (ctx, state) {
          print(state);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home Screen"),
              centerTitle: true,
            ),
            drawer: Drawer(
              width: 200,
              child: Column(
                children: [
                  const DrawerHeader(child: Icon(Icons.person)),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text("About"),
                  ),
                  ListTile(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                      Navigator.pop(context);
                    },
                    title: const Text("Logout"),
                  ),
                ],
              ),
            ),
            body: state is NavigateInitState
                ? [
                    const UserWelcomeScreen(),
                    const CounterHomeScreen(),
                    const TodoeyHomeScreen(),
                     StreamUi(),
                  ][state.index]
                : Container(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                BlocProvider.of<NavigateBloc>(context)
                    .add(NavigateControlEvent(index));
              },
              currentIndex: state is NavigateInitState ? state.index : 0,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Counter",
                  icon: Icon(
                    Icons.countertops,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Task Add",
                  icon: Icon(
                    Icons.add_task,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Stream Ui",
                  icon: Icon(
                    Icons.add_task,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (ctx, state) {});
  }
}
