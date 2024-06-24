import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileTrophy extends StatefulWidget {
  const ProfileTrophy({super.key});

  @override
  State<ProfileTrophy> createState() => _ProfileTrophyState();
}

class _ProfileTrophyState extends State<ProfileTrophy> {
  List<dynamic> Trophies = [];
  @override
  void initState() {
    getTrophy();
    super.initState();
  }

  void getTrophy() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        print('Error: Token is null');
        return;
      }
      final apiURL = 'http://10.0.2.2:8000/profile/getprofile/$token';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      setState(() {
        Trophies = jsonDecode(response.body)['Trophies'];
      });
      print('Trophies: $Trophies');
      print(Trophies.length);
    } catch (e) {
      print('Error getting user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Disable GridView scrolling
        shrinkWrap: true, // Use available height
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1, // Aspect ratio of each item
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
        ),
        itemCount: Trophies.length, // Number of items
        itemBuilder: (context, index) {
          return TrophyCard(
            trophyName: Trophies[index]['trophy_name'],
            trophyUrl: Trophies[index]['trophy_url'],
          );
        },
      ),
    );
  }
}

class TrophyCard extends StatelessWidget {
  final String trophyName;
  final String trophyUrl;

  TrophyCard({
    required this.trophyName,
    required this.trophyUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4,
      color: Color(0xFFFFF5D5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                trophyUrl, // Use trophyUrl from the parameters
                height: 70,
                width: 70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              trophyName, // Use trophyName from the parameters
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFFA86944),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
