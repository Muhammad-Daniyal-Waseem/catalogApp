import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/widgets/itemsWidget.dart';
import 'package:flutter/material.dart';
import 'package:catalogapp/widgets/MyDrawer.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode
import 'dart:async'; // For Timer

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [];
  bool dataLoaded = false;
  bool timeoutReached = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    loadData();

    // Set a 25-second timer to show a timeout message if data is not loaded
    timer = Timer(Duration(seconds: 5), () {
      if (!dataLoaded) {
        setState(() {
          timeoutReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Load data from the JSON file
  void loadData() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final catalogJson = await rootBundle.loadString("assets/catalog.json");
      final decodedData = jsonDecode(catalogJson);
      var productData = decodedData["products"];

      setState(() {
        items = List.from(productData)
            .map<Item>((item) => Item.fromMap(item))
            .toList();
        dataLoaded = true;
      });
    } catch (e) {
      print("Error loading data: $e");
      setState(() {
        timeoutReached = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Catalog App", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: timeoutReached
            ? Center(
                child: Text(
                  "No Product",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            : items.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Itemswidget(
                      item: items[index],
                    ),
                  ),
      ),
      drawer: MyDrawer(),
    );
  }
}
