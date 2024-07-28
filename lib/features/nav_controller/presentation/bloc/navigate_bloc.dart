import 'package:bloc_clean_architechture/features/nav_controller/presentation/bloc/navigate_event.dart';
import 'package:bloc_clean_architechture/features/nav_controller/presentation/bloc/navigate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigateBloc extends Bloc<NavigateEvent,NavigateState>{
  NavigateBloc():super(NavigateInitState(0)){
   on<NavigateControlEvent>(_controlNavigation);
  }
  _controlNavigation(NavigateControlEvent event,Emitter<NavigateState> emit){
    return emit(NavigateInitState(event.index));
  }
}