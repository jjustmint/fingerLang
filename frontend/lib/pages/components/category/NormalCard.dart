import 'package:flutter/material.dart';

class NormalCard extends StatelessWidget {
  String word;
  NormalCard({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20.0, left: 36.0, right: 36.0),
        child: Container(
          width: 320,
          height: 78,
          child: Center(
            child: Text(word,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(
                      0xFFA86944,
                    ))),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5D5),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ));
  }
}
