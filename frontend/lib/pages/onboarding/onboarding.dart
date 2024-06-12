import 'dart:async';

import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  final VoidCallback onFinish;

  const OnboardingPage({required this.onFinish, super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      Timer(const Duration(seconds: 1), widget.onFinish);
      super.initState();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2), // Set background color
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // The background circles
          Positioned(
            top: -250, // Adjust position to extend beyond the top
            right: -150,
            child: CircleAvatar(
              radius: 200, // Increase size
              backgroundColor: const Color(0xFFD09C71),
            ),
          ),
          Positioned(
            bottom: -250, // Adjust position to extend beyond the bottom
            left: -150,
            child: CircleAvatar(
              radius: 200, // Increase size
              backgroundColor: const Color(0xFFD09C71),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/fingerlang.png',
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust width to fit the screen
                  fit: BoxFit.fitWidth, // Ensure the image scales properly
                ),
              ),
              const Text(
                'FINGERLANG',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
