import 'package:flutter/material.dart';
import 'package:frontend/pages/home/Textbox.dart';
import 'package:frontend/pages/home/TopBar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopBar(),
        Transform.translate(
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
        Padding(
          padding: EdgeInsets.only(
            top: 51.0,
            right: 260,
          ),
          child: Image(
            image: AssetImage('assets/images/left_hand.png'),
            width: 136,
            height: 101,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 51.0,
            left: 290.0,
          ),
          child: Image(
            image: AssetImage('assets/images/right_hand.png'),
            width: 136,
            height: 101,
          ),
        ),
        HomeTextBox(),
      ],
    );
  }
}
