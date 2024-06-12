import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 273,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        color: Color(0xFFCC8459),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 102),
            child: Center(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFFFCD2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}