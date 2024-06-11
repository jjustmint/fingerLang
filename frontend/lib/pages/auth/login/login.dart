import 'package:flutter/material.dart';
import 'dart:ui';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCC8459),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned circle with blur effect
          Positioned(
            top: 180,
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1000, sigmaY: 1000), // Adjust the blur intensity here
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  // Apply background color with opacity
                  child: Container(
                    color: const Color(0xFFFFFCD2).withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),
          // Positioned image and text at the top
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70), // Space from the top
                child: Image.asset(
                  'assets/images/fingerlang_Light_ver.png',
                  width: MediaQuery.of(context).size.width, // Adjust width to fit the screen
                  fit: BoxFit.fitWidth, // Ensure the image scales properly
                ),
              ),
              const SizedBox(height: 10), // Margin between image and text
              const Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xFFFFFCD2),
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
          // Positioned blur layer between image and circle
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the blur intensity here
              child: Container(
                color: Colors.transparent, // Make the container transparent
              ),
            ),
          ),
          // Positioned rounded square at the bottom remains the same
          Positioned(
            bottom: -40,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60), // Adjust these values to change the padding
              decoration: BoxDecoration(
                color: Color(0xFFFFFCD2),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: <Widget>[
                  const SizedBox(height: 5), // Margin between texts
                  const SizedBox(height: 20), // Margin between text and buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Change alignment to space buttons evenly
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30), // Match the border radius of the button
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle sign-in action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              foregroundColor: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ), // Space between buttons
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30), // Match the border radius of the button
                          ),
                        ),
                      ),
                    ],
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
