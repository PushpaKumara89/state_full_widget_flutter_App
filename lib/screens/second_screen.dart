import 'package:flutter/material.dart';

import 'home_page.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key,required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen", style: TextStyle(fontSize: 25.0),),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context,const MyHome());
            },
            icon: const Icon(Icons.home),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name, style: const TextStyle(fontSize: 25.0),),
          ],
        ),
      ),
    );
  }
}
