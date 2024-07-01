import 'package:bloc_clean_architechture/features/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_clean_architechture/features/counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(CounterState(0)){
  on<CounterEvent>(_incrementValue);
  on<CounterEvent>(_decrementValue);
  }
 void _incrementValue(CounterEvent counterEvent,Emitter<CounterState> emitCounterState){
    int counter=state.counter+1;
    emitCounterState(CounterState(counter));
 }
 void _decrementValue(CounterEvent counterEvent,Emitter<CounterState> emitCounterState){
    int counter=state.counter-1;
    emitCounterState(CounterState(counter));
 }
}