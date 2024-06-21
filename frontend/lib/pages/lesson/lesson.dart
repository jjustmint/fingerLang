import "package:flutter/material.dart";
import "package:frontend/pages/components/lesson/LessonCard.dart";
import "package:frontend/pages/components/lesson/lessonBar.dart";
import "package:shared_preferences/shared_preferences.dart";

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  String lastestLesson = "";
  String lessonLevel = "";
  String lessonImage = "";
  int lessonId = 0;
  bool _isRecentLesson = false;
  @override
  void initState() {
    CheckRecentLesson();
    super.initState();
  }

  Future<void> CheckRecentLesson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('lastestLesson', "");
    // prefs.setString('lessonLevel', "");
    // prefs.setString('lessonImage', "");
    // prefs.setInt('lessonId', 0);
    setState(() {
      lastestLesson = prefs.getString('lastestLesson') ?? "";
      lessonLevel = prefs.getString('lessonLevel') ?? "";
      lessonImage = prefs.getString('lessonImage') ?? "";
      lessonId = prefs.getInt('lessonId') ?? 0;
      if (lastestLesson.isNotEmpty) {
        _isRecentLesson = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFCD2),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lessonBar(
                  recentLesson: _isRecentLesson,
                  lessonName: lastestLesson,
                  lessonLevel: lessonLevel,
                  lessonImage: lessonImage,
                  id: lessonId,
                  onBackButtonPressed: () {
                    CheckRecentLesson();
                    Navigator.pop(context);
                  }),
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
                child: ListView.builder(
                    itemCount: 5,
                    padding:
                        const EdgeInsets.only(top: 24, left: 20, right: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: LessonCard(
                          Level: "Beginner",
                          LessonName: "test",
                          LessonImage:
                              "https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          id: 1,
                          onBackButtonPressed: () {
                            CheckRecentLesson();
                            Navigator.pop(context);
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
