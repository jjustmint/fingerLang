import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/ProfileAvatar.dart';
import 'package:frontend/pages/profile/ProfileTopBar.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key, // Correct usage of key parameter
  }) : super(key: key); // Calling super constructor with key parameter

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileTopBar(),
        Transform.translate(
          offset: const Offset(66, -160),
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
        Padding(padding: EdgeInsets.only(
          top: 180.0,
          left: 110.0,
        ), child: ProfileAvatar(
        ))
        // Adding ProfileAvatar widget
      ],
    );
  }
}
