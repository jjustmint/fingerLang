import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:frontend/pages/components/category/VocabPage.dart';
import 'package:frontend/pages/components/lesson/notClickable.dart';
import 'package:frontend/pages/lesson/lesson.dart';
import 'package:frontend/pages/lesson/lessonVocabInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VocabList {
  final int id;
  final String name;
  final String gif;
  final String desc;

  VocabList({
    required this.id,
    required this.name,
    required this.gif,
    required this.desc,
  });

  factory VocabList.fromJson(Map<String, dynamic> json) {
    return VocabList(
      id: json['id'],
      name: json['name'],
      gif: json['image_url'],
      desc: json['desc'],
    );
  }
}

class LessonList extends StatefulWidget {
  final String LessonName;
  final String LessonImage;
  final String Level;
  final int id;
  final VoidCallback onBackButtonPressed;
  LessonList(
      {super.key,
      required this.LessonName,
      required this.LessonImage,
      required this.Level,
      required this.id,
      required this.onBackButtonPressed});

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  List<VocabList> vocabList = [];
  List<int> vocabIdList = [];
  @override
  void initState() {
    getLessonVocab();
    recentlyLesson();
    super.initState();
  }

  void recentlyLesson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastestLesson', widget.LessonName);
    prefs.setString('lessonLevel', widget.Level);
    prefs.setString('lessonImage', widget.LessonImage);
    prefs.setInt('lessonId', widget.id);
  }

  void getLessonVocab() async {
    try {
      final apiURL = ("http://10.0.2.2:8000/lesson/getlessonlist/${widget.id}");
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          vocabList = parseVocabList(response.body);
        });
        print('vocabList: $vocabList');
      } else {
        print('Failed to load vocabList data');
      }
    } catch (e) {
      print(e);
    }
  }

  List<VocabList> parseVocabList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<VocabList>((json) {
      return VocabList.fromJson(json['Hand_posts']);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFCD2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                Topic: widget.LessonName,
                onBackButtonPressed: widget.onBackButtonPressed,
              ),
              SizedBox(
                height: 40,
              ),
              notClick(
                  LessonName: widget.LessonName,
                  LessonImage: widget.LessonImage,
                  Level: widget.Level,
                  id: widget.id),
              Stack(
                children: [
                  Padding(
                    //line
                    padding: const EdgeInsets.only(left: 61.0),
                    child: Container(
                      height: 336,
                      width: 3,
                      color: Color(0xFFA86944),
                    ),
                  ),
                  ListView.builder(
                      itemCount: vocabList.length,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<int> postIds =
                            vocabList.map((vocab) => vocab.id).toList();
                        return Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 32.0, top: 50),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFFA86944),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            lessonVocabCard(
                              id: vocabList[index].id,
                              vocabulary: vocabList[index].name,
                              lessonName: widget.LessonName,
                              vocabIdList: postIds,
                              gif: vocabList[index].gif,
                              desc: vocabList[index].desc,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}

class lessonVocabCard extends StatelessWidget {
  int id;
  String lessonName;
  String vocabulary;
  List<int> vocabIdList = [];
  String gif;
  String desc;
  lessonVocabCard({
    super.key,
    required this.id,
    required this.vocabulary,
    required this.lessonName,
    required this.vocabIdList,
    required this.gif,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LessonVocabInfo(
                      id: id,
                      vocabName: vocabulary,
                      gif: gif,
                      categoryName: lessonName,
                      description: desc,
                      vocabIdList: vocabIdList,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 66.0, top: 33),
        child: Container(
          width: 300,
          height: 57,
          decoration: BoxDecoration(
            color: Color(0xFFFFF5D5),
            borderRadius: BorderRadius.circular(10),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12),
                child: Text(
                  vocabulary,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFA86944),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
