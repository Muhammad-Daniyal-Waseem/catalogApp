import 'package:flutter/material.dart';
import 'package:catalogapp/routes.dart'; // Ensure this contains `homeRoute`

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = ""; // Keeps the username entered by the user
  bool changeBtn = false;
  final _formKey = GlobalKey<FormState>();

  // Navigation to the home screen
  navigateToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(
        context,
        Routes.homeRoute, // Replace with your route name
      );
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.blueGrey.shade900
            ], // Black to Dark Blue gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Hero(
                    tag: 'login-image', // Hero tag for smooth transition
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/lock.jpg", // Path to your image
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color for contrast
                    fontFamily: 'Poppins',
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: const Text("Welcome Back!"), // Static attractive text
                ),
                const SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                  child: Column(
                    children: [
                      // Username field with focus effect
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                          filled: true,
                          fillColor: Colors
                              .black54, // Dark background for input fields
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.all(18),
                          focusColor:
                              Colors.deepPurpleAccent, // Focus effect color
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
                      const SizedBox(height: 16),
                      // Password field with smooth focus effect
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          filled: true,
                          fillColor: Colors
                              .black54, // Dark background for password field
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.all(18),
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
                      // Animated Login Button with scaling effect
                      Material(
                        color: Colors
                            .blueGrey.shade900, // Dark Blue for the button
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
      ),
    );
  }
}
