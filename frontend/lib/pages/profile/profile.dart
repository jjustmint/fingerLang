import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/ProfileAppBar.dart';
import 'package:frontend/pages/profile/ProfileTrophy.dart';
import 'package:frontend/pages/profile/StatusBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<dynamic> Trophies = [];
  List<dynamic> Favorites = [];

  @override
  void initState() {
    getTrophy();
    getFavorite();
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
    } catch (e) {
      print('Error getting user profile: $e');
    }
  }

  void getFavorite() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        print('Error: Token is null');
        return;
      }
      final apiURL = 'http://10.0.2.2:8000/profile/getfavorite/$token';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      setState(() {
        Favorites = jsonDecode(response.body)['Favorite'];
      });
      print('Favorite: $Favorites');
    } catch (e) {
      print('Error getting favorite profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            ProfileAppBar(),
            Center(
              child: StatusBox(
                  successCount: Trophies.length,
                  favoriteCount: Favorites.length),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(
                  left: 30.0), // Adjust the left margin as needed
              child: const Text(
                'Trophies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ProfileTrophy(),
          ],
        ),
      ),
    );
  }
}
