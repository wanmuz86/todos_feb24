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
          TextField(decoration: InputDecoration(hintText:"Enter item name"),
            controller: nameEditingController,),
          TextField(decoration: InputDecoration(hintText:"Enter item description"),
            controller: descEditingController,),
          TextField(decoration: InputDecoration(hintText:"Enter item place"),
            controller: placeEditingContorller,),
          ElevatedButton(onPressed: (){
            print(nameEditingController.text);
            print(descEditingController.text);
            print(placeEditingContorller.text);

            var newItem = {
              "name":nameEditingController.text,
              "place":placeEditingContorller.text,
              "description":descEditingController.text
            };
            // Return to previous page
            // 2) Pass the new item as second argument of navigator.pop
            Navigator.pop(context,newItem);

          }, child: Text("Add new item"))
        ],
      ),
    );
  }
}
