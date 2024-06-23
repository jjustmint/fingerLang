import "dart:convert";

import "package:flutter/material.dart";
import "package:frontend/pages/components/lesson/LessonCard.dart";
import "package:frontend/pages/components/lesson/lessonBar.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'package:http/http.dart' as http;

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class Lessons {
  final String lessonName;
  final String lessonLevel;
  final String lessonImage;
  final int id;

  Lessons({
    required this.lessonName,
    required this.lessonLevel,
    required this.lessonImage,
    required this.id,
  });

  factory Lessons.fromJson(Map<String, dynamic> json) {
    return Lessons(
      lessonName: json['lessons_name'],
      lessonLevel: json['level'],
      lessonImage: json['lesson_url'],
      id: json['id'],
    );
  }
}

class _LessonPageState extends State<LessonPage> {
  String lastestLesson = "";
  String lessonLevel = "";
  String lessonImage = "";
  int lessonId = 0;
  bool _isRecentLesson = false;
  List<Lessons> lessons = [];

  @override
  void initState() {
    CheckRecentLesson();
    getLesson();
    super.initState();
  }

  Future<void> CheckRecentLesson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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

  void getLesson() async {
    try {
      final apiURL = 'http://10.0.2.2:8000/lesson/getlesson';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('getLesson');
        setState(() {
          lessons = parseLesson(response.body);
        });
        print('Categories: $lessons');
        print('LessonId: ${lessons[1].id}');
      } else {
        print('Failed to load lesson data');
      }
    } catch (e) {
      print('ERROR: $e');
    }
  }

  List<Lessons> parseLesson(String body) {
    try {
      List<dynamic> jsonData = jsonDecode(body);
      return jsonData.map((json) => Lessons.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
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
                    itemCount: lessons.length,
                    padding:
                        const EdgeInsets.only(top: 24, left: 20, right: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: LessonCard(
                          Level: lessons[index].lessonLevel,
                          LessonName: lessons[index].lessonName,
                          LessonImage: lessons[index].lessonImage,
                          id: lessons[index].id,
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
