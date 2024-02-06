import 'package:flutter/material.dart';
import 'package:todos/widgets/add.dart';
import 'package:todos/widgets/detail.dart';

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
          // how many rows are there -> It has the same number of rows as the data
          itemCount: _todos.length,

          // What to show on each row ->
          // For every row (represented by index)
          // Show a container (box/div) of colour amber, of height 50
          // in which has a centered text labeled with the todos of each row
          // if row/index 0 => todos[0] row/index 1 =>todos[1]
          itemBuilder: (BuildContext context, int index) {
            // return Container(
            //   height: 50,
            //   color: Colors.amber,
            //   child: Center(child: Text('Entry: ${_todos[index]["name"]}')),
            // );
            return Card(
              child: ListTile(
                title: Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  // 3) Pass the data to second page through the constructor
                  Navigator.push(context,MaterialPageRoute(builder:
                      (context)=>DetailPage(item: _todos[index],)));
                },
              ),
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
