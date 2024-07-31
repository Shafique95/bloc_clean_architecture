import 'package:bloc_clean_architechture/flutter_stream/domain/entity/programm_entity.dart';
import 'package:bloc_clean_architechture/flutter_stream/presentation/stream_controller/stream_controller.dart';
import 'package:flutter/material.dart';

class StreamUi extends StatelessWidget {
  StreamUi({super.key});
  final StreamControllerExample streamControllerExample =
      StreamControllerExample();
  final TextEditingController textEditingController= TextEditingController();
  @override
  Widget build(context) {
    return Scaffold(
      body: StreamBuilder<List<ProgramEntity>>(
        stream: streamControllerExample.streamOfListProgram,
        builder: (_, snapshot) {
          if(snapshot.hasData){
            var dataList=snapshot.data!;
            return Column(children: [
              ...dataList.map((programEntity)=>Text(programEntity.programName)),
            const  SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                streamControllerExample.addProgram(ProgramEntity(textEditingController.text.trim()));
                textEditingController.clear();
              }, child: const Text("Add Lang"))
            ],);
          }else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }else{
            return const CircularProgressIndicator();
          }

        },
      ),
    );
  }
}
