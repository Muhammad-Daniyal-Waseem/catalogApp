import 'package:catalogapp/components/home/catlogList.dart';
import 'package:catalogapp/components/home/header.dart';
import 'package:catalogapp/models/catalog.dart';
// import 'package:catalogapp/widgets/itemsWidget.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
// import 'package:catalogapp/widgets/MyDrawer.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode
import 'dart:async'; // For Timer
import 'package:velocity_x/velocity_x.dart';

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

    timer = Timer(const Duration(seconds: 20), () {
      if (!dataLoaded) {
        setState(() {
          timeoutReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void loadData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
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
      setState(() {
        timeoutReached = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              if (timeoutReached)
                Column(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 64),
                    "Page not found!".text.red500.xl2.makeCentered(),
                  ],
                ).centered()
              else if (dataLoaded) ...[
                const CatalogHeader(),
                Expanded(child: CatalogList(items: items)),
              ] else
                CircularProgressIndicator()
                    .centered()
                    .box
                    .rounded
                    .color(Themes.darkBlueColor)
                    .p16
                    .makeCentered(),
            ],
          ),
        ),
      ),
    );
  }
}
