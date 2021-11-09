import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int typeId;

  const DetailPage({Key? key, required this.typeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: typeId == 1
              ? Text("Burgers")
              : typeId == 2
              ? Text("Pizzas")
              : Text("Salads"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: Center(
            child: typeId == 1
                ? Text("Burgers", style: TextStyle(color: Colors.black))
                : typeId == 2
                    ? Text("Pizzas", style: TextStyle(color: Colors.black))
                    : Text("Salads", style: TextStyle(color: Colors.black))));
  }
}
