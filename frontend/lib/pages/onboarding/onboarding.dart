import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // The background circles
                Positioned(
                  top: 50,
                  left: 50,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xFFD09C71),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 50,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xFFD09C71),
                  ),
                ),
                // The hands
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        'assets/images/fingerlang.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const Text(
                      'FINGERLANG',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
