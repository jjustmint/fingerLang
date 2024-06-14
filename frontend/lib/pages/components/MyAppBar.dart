import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppBar extends StatelessWidget {
  final String Topic;
  MyAppBar({
    super.key,
    required this.Topic,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 157,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            color: Color(0xFFCC8459),
          ),
        ),
        Positioned(
          top: 101,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              Topic,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color(0xFFFFFCD2),
              ),
            ),
          ),
        ),
        Positioned(
          top: -160,
          left: 66,
          child: Container(
            height: 262,
            width: 262,
            decoration: BoxDecoration(
              color: Color(0xFFFFFCD2),
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFFFCD2).withOpacity(1),
                  const Color(0xFFFFFCD2).withOpacity(0.0),
                ],
                stops: [0.3, 3.0],
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
