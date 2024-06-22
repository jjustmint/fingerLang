import 'package:flutter/material.dart';
import 'package:frontend/pages/auth/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({Key? key}) : super(key: key);

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("token", "");
                Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 273,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        color: Color(0xFFCC8459),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50, // Adjust as needed
            right: 20, // Adjust as needed
            child: IconButton(
              onPressed: () => _showSignOutDialog(context),
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Color(0xFFFFFCD2),
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
