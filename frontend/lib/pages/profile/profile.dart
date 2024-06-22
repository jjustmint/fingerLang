import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/ProfileAppBar.dart';
import 'package:frontend/pages/profile/ProfileTrophy.dart';
import 'package:frontend/pages/profile/StatusBox.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
          children: [
            ProfileAppBar(),
            Center(
              child: StatusBox(successCount: 4, continueCount: 0, favoriteCount: 0),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 30.0), // Adjust the left margin as needed
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
