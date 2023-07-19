import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/Users.dart';

class CallApi extends StatefulWidget {
  const CallApi({super.key});


  @override
  State<CallApi> createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {

  Future<List<User>> getUsers() async{
    // var url = Uri.parse("https://randomuser.me/api/?results=5000");
    var url = Uri.parse("https://randomuser.me/api/?results=50");
    late http.Response response;
    List<User> uses =[];
    try{
      response = await http.get(url);

      if(response.statusCode ==200){
        Map peoplesData = jsonDecode(response.body);
        List<dynamic> peoples = peoplesData["results"];
        for (var item in peoples){
          var email = item['email'];
          var name = item['name']['first'];
          var id = item['login']['uuid'];
          var avatar = item['picture']['large'];
          uses.add(User(id, name, email, avatar));
        }
      } else {
        return Future.error("Something gone wrong, ${response.statusCode}");
      }
    }catch(e){
      return Future.error(e.toString());
    }
    return uses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call Api"),
      ),
      body: FutureBuilder(future:getUsers() , builder: (BuildContext context, AsyncSnapshot snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: Text("Wailing"),
          );
        } else {
          if(snapshot.hasError){
            return const Center(
              child: Text("error"),
            );
          }else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data[index].avatar),
                  ),
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].email),
                  onTap: (){},
                );
              },
            );
          }
        }
      }),
    );
  }
}