import 'package:flutter/material.dart';

class ProfileTrophy extends StatefulWidget {
  const ProfileTrophy({super.key});

  @override
  State<ProfileTrophy> createState() => _ProfileTrophyState();
}

class _ProfileTrophyState extends State<ProfileTrophy> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
        shrinkWrap: true, // Use available height
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1, // Aspect ratio of each item
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
        ),
        itemCount: 10, // Number of items
        itemBuilder: (context, index) {
          return TrophyCard();
        },
      ),
    );
  }
}

class TrophyCard extends StatelessWidget {
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
              child: Image.asset(
                'assets/images/Trophy.png', // Replace with your image path
                height: 70,
                width: 70,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Trophy name',
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
