import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Curriculum.dart';

class CustomDrawer extends StatelessWidget {
  final Uri _url = Uri.parse('https://myket.ir/app/com.mmdsarhadi.software');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: null,

            accountEmail: Text(
              'تکرار کننده متن',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: "Lalezar-Regular",
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the header
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/download.jpg",
                ),
                // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text(
              'توسعه  دهنده',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Lalezar-Regular",
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Curriculum()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text(
              'خروج',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Lalezar-Regular",
              ),
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
