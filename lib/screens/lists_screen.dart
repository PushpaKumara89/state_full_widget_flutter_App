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
    var items = List<String>.generate(100, (index) => 'items $index');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
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
