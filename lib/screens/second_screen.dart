import 'package:flutter/material.dart';

import 'home_page.dart';
import 'lists_screen.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key,required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Screen", style: TextStyle(fontSize: 25.0),),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context,const MyHome());
              },
              icon: const Icon(Icons.home),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context){
                          return const ListsScreen();
                        }
                    )
                  );
                },
                icon: const Icon(Icons.list),
          )
          ],
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
