import "package:flutter/material.dart";
import "package:frontend/pages/components/lesson/LessonCard.dart";
import "package:frontend/pages/components/lesson/lessonBar.dart";

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFCD2),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lessonBar(recentLesson: true),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 19),
                child: Text(
                  "Lessons",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Center(
                child: LessonCard(
                    LessonName: "test",
                    LessonImage:
                        "https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    id: 1),
              )
            ],
          ),
        ));
  }
}
