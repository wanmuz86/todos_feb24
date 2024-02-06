import 'package:flutter/material.dart';
import 'package:todos/widgets/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do app"),),
      body: Text("To do"),
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
