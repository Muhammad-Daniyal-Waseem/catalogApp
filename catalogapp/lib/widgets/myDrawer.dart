import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    // Set the background color here
                    ),
                margin: EdgeInsets.zero,
                currentAccountPicture: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(
                        2), // Space between the border and CircleAvatar
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Ensures the border is circular
                      border: Border.all(
                        color: Colors.black26, // Color of the border
                        width: 3, // Thickness of the border
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50, // Adjust the size of the CircleAvatar
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage("assets/images/my.png"),
                    ),
                  ),
                ),
                accountName: Text("Daniyal Waseem"),
                accountEmail: Text("daniyalwaseem0808@gmail.com"),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
