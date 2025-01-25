import 'package:catalogapp/pages/home.dart';
import 'package:catalogapp/pages/login.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme(context),
        darkTheme: Themes.darkTheme(context),
        initialRoute: Routes.homeRoute,
        routes: {
          Routes.homeRoute: (context) => Home(),
          Routes.loginRoute: (context) => Login(),
        });
  }
}
