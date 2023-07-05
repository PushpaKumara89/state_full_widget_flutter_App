import 'package:flutter/material.dart';

import 'second_screen.dart';


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Full Widget", style: TextStyle(fontSize: 25.0),),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Home Page", style: TextStyle(fontSize: 25.0),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_){
                      return const SecondScreen(name: "PUSH");
                    }
                )
            );

            //Navigator.of(context).pushNamed('/second');

          },
          child: const Icon(Icons.navigate_next)
      ),
    );
  }
}