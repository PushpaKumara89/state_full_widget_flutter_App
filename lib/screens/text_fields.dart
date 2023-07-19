import 'package:flutter/material.dart';

import 'forms_screen.dart';
import 'home_page.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = '';
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(2.5),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: (){
                  },
                  icon: const Icon(Icons.search, color: Colors.deepOrange,)
              ),
              suffixIcon: IconButton(
                  onPressed: (){
                    title.text ='';
                  },
                  icon: const Icon(Icons.close, color: Colors.white,)
              ),
              border: InputBorder.none,
              filled: true,
              hintText: 'Search..',
              hintStyle: const TextStyle(color: Colors.white),
            ),
            controller: title, // get data and set data to textField
            style: const TextStyle(fontSize: 20.5),
            cursorColor: Colors.red,
            autofocus: true,

          ),
        ),
        // title: const Text("Text Fields", style: TextStyle(fontSize: 25.0),),
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
                        return const FormsScreen();
                      }
                  )
                );
              },
              icon: const Icon(Icons.panorama_vertical_select)
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: title, // get data and set data to textField
                style: const TextStyle(fontSize: 35.5),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                // obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 12,
                cursorColor: Colors.red,
                style: TextStyle(fontSize: 35.5),
              ),
            ),
            // Text field Events //
            /* Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                cursorColor: Colors.red,
                onSubmitted: (text){
                  print(text);
                },
                onChanged: (text) {
                  print(text);
                },
                style: const TextStyle(fontSize: 35.5),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                // obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 12,
                cursorColor: Colors.red,
                style: TextStyle(fontSize: 35.5),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 12,
                autofocus: true,
                style: TextStyle(fontSize: 35.5),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(fontSize: 35.5),
                enabled: false,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

/*
class TextFields extends StatelessWidget {
  const TextFields({super.key});

  //TextEditingController title = TextEditingController(); //error cant create this ob in state less Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Fields", style: TextStyle(fontSize: 25.0),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,const MyHome());
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                controller: ,
                style: const TextStyle(fontSize: 35.5),
              ),
            ),

            // Text field Events //
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                cursorColor: Colors.red,
                onSubmitted: (text){
                  print(text);
                },
                onChanged: (text) {
                  print(text);
                },
                style: const TextStyle(fontSize: 35.5),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                // obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 12,
                cursorColor: Colors.red,
                style: TextStyle(fontSize: 35.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 12,
                autofocus: true,
                style: TextStyle(fontSize: 35.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(fontSize: 35.5),
                enabled: false,
              ),
            )
          ],
        ),
      ),
    );
  }

  
}
*/
