// Imports
import 'package:catalogapp/components/home/catlogList.dart';
import 'package:catalogapp/components/home/header.dart';
import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/routes.dart';
import 'package:catalogapp/widgets/myDrawer.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:velocity_x/velocity_x.dart';

// Home Screen
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Vx.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 2,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.cart, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartRoute);
              },
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Themes.creamcolor,
                Themes.darkBlueColor.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: Vx.m16,
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
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Themes.darkBlueColor,
                    )
                        .centered()
                        .box
                        .rounded
                        .p16
                        .color(Colors.blue.withOpacity(0.1))
                        .makeCentered(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
