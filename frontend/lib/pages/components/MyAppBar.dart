import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppBar extends StatelessWidget {
  String Topic;
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
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            //Topic
            children: [
              Padding(
                padding: EdgeInsets.only(top: 101),
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
            ],
          ),
        ),
        Transform.translate(
          // light circle
          offset: const Offset(66, -160),
          child: Container(
            // padding: EdgeInsets.only(bottom: 102),
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
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
