import 'dart:async';

import 'package:bloc_clean_architechture/flutter_stream/domain/entity/programm_entity.dart';

class StreamControllerExample{
  StreamControllerExample(){
    _updateList();
  }
final StreamController<List<ProgramEntity>> _listOfProgram=StreamController<List<ProgramEntity>>();
StreamSink<List<ProgramEntity>> get sinkOfListProgram=> _listOfProgram.sink;
Stream<List<ProgramEntity>> get streamOfListProgram=> _listOfProgram.stream;

/// sample data
List<ProgramEntity> _programList=[
  ProgramEntity("Java"),
  ProgramEntity("Python"),
  ProgramEntity("Dart"),
  ProgramEntity("Dart"),
  ProgramEntity("Dart"),
];
_updateList(){
  sinkOfListProgram.add(_programList);
}

addProgram(ProgramEntity pgme){
  _programList.add(pgme);
  _updateList();
}

}