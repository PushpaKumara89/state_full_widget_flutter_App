import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test app",
      home: MyHome(),
      /*routes: <String, WidgetBuilder>{
        '/second': (context)=> const SecondScreen(),
      },*/
    );
  }
}
