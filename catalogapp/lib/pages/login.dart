import 'package:flutter/material.dart';
import 'package:catalogapp/routes.dart'; // Ensure this contains `homeRoute`

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeBtn = false;
  final _formKey = GlobalKey<FormState>();

  navigateToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(
          context, Routes.homeRoute); // Replace with valid route
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset(
                  "assets/images/person.jpg",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty!";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty!";
                        } else if (value.length < 6) {
                          return "Password length should be at least 6!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
                      child: InkWell(
                        onTap: () => navigateToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeBtn ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeBtn
                              ? const Icon(Icons.done, color: Colors.white)
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
