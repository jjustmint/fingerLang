import 'package:flutter/material.dart';

class categoryCard extends StatelessWidget {
  const categoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //category card
      height: 97,
      width: 358,
      decoration: BoxDecoration(
        color: Color(0xFFFFF5D5),
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 21, bottom: 30),
            child: Text('Alphabet',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFA86944))),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 9, left: 256, right: 20, bottom: 8),
            child: Image.asset(
              'assets/images/abc.png',
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}