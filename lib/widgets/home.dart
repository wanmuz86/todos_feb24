import 'package:flutter/material.dart';
import 'package:todos/widgets/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String,String>> _todos = [
    {
      "name":"Learn Listview",
      "place":"Online Zoom",
      "description":"Listview, builder, Listtile, and Card"
    },
    {
      "name":"Navigation",
      "place":"Online Zoom",
      "description":"Basic navigation (push, pop), Pass data forward, pass data backward"
    },
    {
      "name":"Lunch break",
      "place":"Own place",
      "description":"1h - 1h30 break depending on QnA"
    },
    {
      "name":"Shared Preference",
      "place":"Online Zoom",
      "description":"sharing and retrieving local data"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do app"),),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber,
              child: Center(child: Text('Entry: ${_todos[index]["name"]}')),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          // Open add page
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
        },
      ),
    );
  }
}
