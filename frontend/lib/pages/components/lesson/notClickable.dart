import 'package:flutter/material.dart';
import 'package:frontend/pages/home/InfoCategory.dart';
import 'package:frontend/pages/lesson/LessonList.dart';

class notClick extends StatelessWidget {
  String LessonName;
  String LessonImage;
  String Level;
  int id;
  notClick({
    super.key,
    required this.LessonName,
    required this.LessonImage,
    required this.Level,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //category card
      height: 120,
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
            padding: const EdgeInsets.only(top: 24, left: 21, bottom: 30),
            child: Text(LessonName,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFA86944))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 21, bottom: 30),
            child: Text(Level,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA86944))),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 270, right: 20, bottom: 8),
            child: Image.network(
              LessonImage,
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
