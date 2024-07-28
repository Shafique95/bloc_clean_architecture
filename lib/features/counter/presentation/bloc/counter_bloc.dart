import 'package:bloc_clean_architechture/features/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_clean_architechture/features/counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(CounterState(0)){
  on<Increment>(_incrementValue);
  on<Decrement>(_decrementValue);
  on<ClearData>(_clearDataEvent);
  }
 void _incrementValue(Increment increment,Emitter<CounterState> emitCounterState){
    int counter=state.counter+1;
    emitCounterState(CounterState(counter));
 }
 void _decrementValue(Decrement decrement,Emitter<CounterState> emitCounterState){
    int counter=state.counter-1;
    emitCounterState(CounterState(counter));
 }
 void _clearDataEvent(ClearData clearDataEvent, Emitter<CounterState> emit){
    emit(CounterState(0));
 }
}