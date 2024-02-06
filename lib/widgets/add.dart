import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Item"),),
      body: Column(
        children: [
          Text("Enter all the information"),
          TextField(decoration: InputDecoration(hintText:"Enter item name"), controller: nameEditingController,),
          TextField(decoration: InputDecoration(hintText:"Enter item description"), controller: descEditingController,),
          TextField(decoration: InputDecoration(hintText:"Enter item place"), controller: placeEditingContorller,),
          ElevatedButton(onPressed: (){
            print(nameEditingController.text);
            print(descEditingController.text);
            print(placeEditingContorller.text);
            // Return to previous page
            Navigator.pop(context);

          }, child: Text("Add new item"))
        ],
      ),
    );
  }
}
