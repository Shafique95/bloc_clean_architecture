import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterHomeScreen extends StatelessWidget {
  const CounterHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // BlocBuilder<CounterBloc, CounterState>(
            //   builder: (_, blocState) {
            //     return Text(
            //       '${blocState.counter}',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            BlocConsumer<CounterBloc, CounterState>(
              listenWhen: (ps,ns){
                return true;/// if its return true listener will active meas will listens
              },
              listener: (stx, state) {
                if (state.counter < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("invalid"),
                    ),
                  );
                }
              },
              buildWhen: (ps,ns){
                return ps != ns;/// if its return true builder will build something for Ui
              },
              builder: (ctx, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },

            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(ClearData());
            },
            child: const Icon(Icons.clear),
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
