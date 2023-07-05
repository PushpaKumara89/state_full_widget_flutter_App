import 'package:flutter/material.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test app",
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int count = 0;

  void increament(){
    setState(() {
      count = count +1;
      print(count);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Full Widget", style: TextStyle(fontSize: 25.0),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Counts of Button Click", style: TextStyle(fontSize: 25.0),),
            Text(count.toString(), style: const TextStyle(fontSize: 22.0),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: increament,
          child: const Icon(Icons.add)
      ),
    );
  }
}