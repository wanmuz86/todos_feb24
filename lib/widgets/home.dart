import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todos/widgets/add.dart';
import 'package:todos/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Beacause the usage of Shared preference 
  List<dynamic> _todos = [
    {
      "name":"Learn Listview",
      "place":"Online Zoom",
      "description":"Listview, builder, Listtile, and Card",
      "completed":true
    },
    {
      "name":"Navigation",
      "place":"Online Zoom",
      "description":"Basic navigation (push, pop), Pass data forward, pass data backward",
      "completed":true
    },
    {
      "name":"Lunch break",
      "place":"Own place",
      "description":"1h - 1h30 break depending on QnA",
      "completed":true
    },
    {
      "name":"Shared Preference",
      "place":"Online Zoom",
      "description":"sharing and retrieving local data",
      "completed":false
    }
  ];

  // Inialization of the page is done here
  // When the page is loaded

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    // Obtain shared preferences. / open file manager
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var todosString  = prefs.getString("todos");
    if (todosString != null){
      setState(() {
        // transform from String to List of Map<String,dynamic>
        // setState => refresh the UI
        _todos = jsonDecode(todosString) ;
      });
    }
  }
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
                leading: _todos[index]["completed"] == true ? Icon(Icons.check) : SizedBox(),
                title: Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  // 3) Pass the data to second page through the constructor
                 var respond = await Navigator.push(context,MaterialPageRoute(builder:
                      (context)=>DetailPage(item: _todos[index], index: index,)));
                 if (respond != null){
                   if (respond["action"] == 1){
                     //delete
                     _todos.removeAt(respond["index"]);
                     setState(() {
                       _todos;
                     });
                   }
                   else {
                     //edit
                     // reverse the value of completed
                     _todos[respond["index"]]["completed"] =   !_todos[respond["index"]]["completed"] ;
                     setState(() {
                       _todos;
                     });

                   }
                 }
                },
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // Open add page
          // WAITT FOR THE SECOND PAGE TO END
          // RETRIEVE THE ITEM PASSED FROM THE SECOND PAGE
          // in dart, whenever there is the word await (a way of process asynchronous programming)
          // add async to the nearest function {}
         var newItem =  await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));

         if (newItem != null) {
           // 3rd) Process the item and refresh the UI
           _todos.add(newItem);

           ///SAVE!!!
           ///// Obtain shared preferences./ file manager

           final SharedPreferences prefs = await SharedPreferences.getInstance();
           // SHared preference can only store basic data type
           // String, int, double, boolean , List<String>
           // If i am storing other data type, I can transform to String
           // Map, Array of Map can be transformed Using jsonEncode ('dart:convert')
           // Saving inside shared preference item _todos
           // using filename/key "todos"
           prefs.setString("todos", jsonEncode(_todos));

           setState(() {
             _todos; // _todos = _todos;
           });
         }
        },
      ),
    );
  }
}
