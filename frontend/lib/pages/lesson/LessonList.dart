import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:frontend/pages/components/lesson/notClickable.dart';

class LessonList extends StatelessWidget {
  final String LessonName;
  final String LessonImage;
  final String Level;
  final int id;
  LessonList(
      {super.key,
      required this.LessonName,
      required this.LessonImage,
      required this.Level,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFCD2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(Topic: LessonName),
              SizedBox(
                height: 40,
              ),
              notClick(
                  LessonName: LessonName,
                  LessonImage: LessonImage,
                  Level: Level,
                  id: id),
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
                      itemCount: 4,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
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
                              Vocabulary: "test",
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
  String Vocabulary;
  lessonVocabCard({
    super.key,
    required this.Vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Vocabulary,
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
    );
  }
}
