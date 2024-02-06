import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // 1) Step 1 : Variable to store data from sender
  Map<String,String> item;
  // 2) Create constructor with item is inside parameter
  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body: Center(
        child: Column(
          children: [
            Text(item["name"]!),
            Text(item["description"]!),
            Text(item["place"]!),
          ],
        ),
      ),
    );
  }
}
