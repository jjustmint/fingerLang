import 'package:flutter/material.dart';

class Prelogin extends StatefulWidget {
  const Prelogin({Key? key}) : super(key: key);

  @override
  State<Prelogin> createState() => _PreloginState();
}

class _PreloginState extends State<Prelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned image and text at the top
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100), // Space from the top
                child: Image.asset(
                  'assets/images/fingerlang.png',
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust width to fit the screen
                  fit: BoxFit.fitWidth, // Ensure the image scales properly
                ),
              ),
              const SizedBox(height: 10), // Margin between image and text
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
          // Positioned rounded square at the bottom
          Positioned(
            bottom: -40,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 60), // Adjust these values to change the padding
              decoration: BoxDecoration(
                color: const Color(0xFFCC8459),
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
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0), // Space from left and right
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                        color: Color(0xFFFFFCD2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5), // Margin between texts
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0), // Space from left and right
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFCD2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Margin between text and buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Change alignment to space buttons evenly
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30), // Match the border radius of the button
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle sign-in action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              foregroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
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
                      ),
                      const SizedBox(width: 40), // Space between buttons
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30), // Match the border radius of the button
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle sign-up action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color.fromARGB(255, 15, 15, 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
