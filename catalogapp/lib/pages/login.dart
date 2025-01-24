import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0), // Adjust the padding as needed
            child: Image.asset(
              "assets/images/person.jpg",
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Welcome",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username", labelText: "Username")),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print("Login button clicked!");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
