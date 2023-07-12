import 'package:flutter/material.dart';

import 'home_page.dart';


class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  Widget hardCordedList(){
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            color: Colors.green,
          ),
          Container(
            height: 200.0,
            color: Colors.deepOrange,
          ),
          Container(
            height: 200.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget listView(){
    return ListView(
        children: [
          Container(
            height: 200.0,
            width: 100.0,
            color: Colors.green,
          ),
          Container(
            height: 200.0,
            width: 100.0,
            color: Colors.deepOrange,
          ),
          Container(
            height: 200.0,
            width: 100.0,
            color: Colors.blue,
          ),
          Container(
            height: 200.0,
            width: 100.0,
            color: Colors.deepPurple,
          ),
        ],
    );
  }


  Widget listTiles(){
    return ListView(
      //scrollDirection: Axis.vertical, // implicitly Axis.vertical
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.brightness_auto),
          title: const Text("Brightness Auto"),
          subtitle: const Text("Change the Brightness settings"),
          trailing: const Icon(Icons.menu),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text("Image"),
          subtitle: const Text("Change Image"),
          trailing: const Icon(Icons.menu),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.keyboard),
          title: const Text("Keyboard Layout"),
          subtitle: const Text("Change the Keyboard Layout"),
          trailing: const Icon(Icons.menu),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Phone Settings"),
          subtitle: const Text("Change Phone Settings"),
          trailing: const Icon(Icons.menu),
          onTap: () {},
        ),
      ],
    );
  }


  Widget dynamicDataList(){
    List<User> userList = [
      User(name: 'John Smith', age: 28, city: 'New York'),
      User(name: 'Emily Johnson', age: 35, city: 'Los Angeles'),
      User(name: 'Michael Brown', age: 42, city: 'Chicago'),
      User(name: 'Sarah Davis', age: 31, city: 'Houston'),
      User(name: 'David Wilson', age: 24, city: 'Miami'),
      User(name: 'Jessica Miller', age: 29, city: 'Seattle'),
      User(name: 'Matthew Thompson', age: 37, city: 'Boston'),
      User(name: 'Olivia Clark', age: 26, city: 'San Francisco'),
      User(name: 'Daniel Martinez', age: 33, city: 'Dallas'),
      User(name: 'Sophia Anderson', age: 39, city: 'Atlanta'),
      User(name: 'William Lee', age: 22, city: 'Phoenix'),
      User(name: 'Ava Thomas', age: 44, city: 'Denver'),
      User(name: 'James Johnson', age: 31, city: 'Charlotte'),
      User(name: 'Isabella Davis', age: 27, city: 'Portland'),
      User(name: 'Logan Anderson', age: 36, city: 'San Diego'),
      User(name: 'Mia Wilson', age: 25, city: 'Austin'),
    ];
    //var items = List<String>.generate(100, (index) => 'items $index');
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(userList[index].name),
          subtitle: Text("Age ${userList[index].age}"),
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Types of Lists Views", style: TextStyle(fontSize: 25.0),),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context,const MyHome());
            },
            icon: const Icon(Icons.home),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.list),text: "hard cord List",),
              Tab(icon: Icon(Icons.list),text: "List",),
              Tab(icon: Icon(Icons.list),text: "List Tiles",),
              Tab(icon: Icon(Icons.list),text: "dynamic data Lists",)
            ],
          ),
          elevation: 20.5,
        ),
        body:
         TabBarView(
          children: [
            hardCordedList(),
            listView(),
            listTiles(),
            dynamicDataList()
          ],
        ),
      ),
    );
  }
}


class User {
  String name;
  int age;
  String city;

  User({required this.name, required this.age, required this.city});
}