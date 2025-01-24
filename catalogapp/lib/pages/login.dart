import 'package:flutter/material.dart';
import 'package:catalogapp/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeBtn = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 100.0), // Adjust the padding as needed
              child: Image.asset(
                "assets/images/person.jpg",
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeBtn = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, Routes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeBtn ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
                      ),
                      child: changeBtn
                          ? Icon(Icons.done, color: Colors.white)
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
