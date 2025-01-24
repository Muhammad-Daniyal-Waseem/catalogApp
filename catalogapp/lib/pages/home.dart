import 'package:flutter/material.dart';
import 'package:catalogapp/widgets/MyDrawer.dart'; // Ensure this contains `homeRoute`

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Hello Daniyal Waseem,"),
      ),
      drawer: MyDrawer(),
    );
  }
}
