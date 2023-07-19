import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_full_widget/screens/call_apis_screen.dart';

class StreamData extends StatefulWidget {
  const StreamData({super.key});

  @override
  State<StreamData> createState() => _StreamDataState();
}

class _StreamDataState extends State<StreamData> {
  //stream 1st method Start
  final StreamController _controller = StreamController();

  addStreamData() async{
    for (var i=0; true; i++){
      await Future.delayed(const Duration(seconds: 2));
      if(!_controller.isClosed){
        print(i);
        _controller.sink.add(i);
      }
    }
  }
  @override
  void dispose() {
    super.dispose();
    _controller.close();
  } //in this case Stream Controller should closed when go to other screen so this run in background and may be memory leak

  //stream 1st method End

  //stream 2nd method Start
  Stream<int> addStreamData2() async*{
    for (var i=0; true; i++){
      await Future.delayed(const Duration(seconds: 2));
      yield i;
    }
  }
  //stream 2nd method end

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData2();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Data"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_){
                        return const CallApi();
                      }
                  )
                );
              },
              icon: const Icon(Icons.api),
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: addStreamData2().where((event) => event.isEven),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return const Text("Error");
            } else if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator.adaptive();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Stream Item"),
                Text(
                  "${snapshot.data}",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
