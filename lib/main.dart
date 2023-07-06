import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_page.dart';

void main()=> runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "Test app",
      home: const MyHome(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,

      ),
      /*routes: <String, WidgetBuilder>{
        '/second': (context)=> const SecondScreen(),
      },*/
    );
  }
}
