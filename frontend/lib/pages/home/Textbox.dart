import 'package:flutter/material.dart';

class HomeTextBox extends StatelessWidget {
  const HomeTextBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 159,
            width: 361,
            margin: const EdgeInsets.only(top: 157),
            decoration: BoxDecoration(
              color: Color(0xFFFFFEEA),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 27.0, right: 95.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFA86944),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Text(
                      'Explore, learn, and conquer! Let\'s embark on a journey to master new words and concepts.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA86944),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 183.0, left: 228),
            child: Image.asset(
              'assets/images/Hello.png',
              width: 133,
              height: 133,
            ),
          )
        ],
      ),
    );
  }
}
