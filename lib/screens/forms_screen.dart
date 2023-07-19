import 'package:flutter/material.dart';

import 'home_page.dart';


class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name='';
  String _password='';

  Widget _buildNameField(){
    return TextFormField(
      maxLength: 20,
      decoration: const InputDecoration(hintText: 'Name',),
      maxLines: 1,
      validator: (text){
        if(text!.isEmpty){
          return 'Name cannot be empty';
        }
        return null;
      },
      onSaved: (text){
        _name = text.toString();
      },
    );
  }

  Widget _buildPasswordField(){
    return TextFormField(
      maxLength: 12,
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password',),
      maxLines: 1,
      validator: (text){
        if(text!.isEmpty){
          return 'Please enter password.';
        }
        return null;
      },
      onSaved: (text){
        _password = text.toString();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Text Form"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,const MyHome());
          },
          icon: const Icon(Icons.home),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(24.5),
            child: Column(
              children: <Widget>[
                _buildNameField(),
                _buildPasswordField(),
                const SizedBox(height: 100,),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState?.save();
                      print("name: $_name password : $_password");
                    }
                  },
                  child: const Text("Save", style: TextStyle(fontSize: 16.2),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
