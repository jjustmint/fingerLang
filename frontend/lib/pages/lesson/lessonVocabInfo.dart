import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:http/http.dart' as http;

class LessonVocabInfo extends StatefulWidget {
  final int id;
  final String categoryName;
  final String vocabName;
  final String gif;
  final String description;
  final List<int> vocabIdList;

  LessonVocabInfo({
    super.key,
    required this.id,
    required this.categoryName,
    required this.vocabName,
    required this.gif,
    required this.description,
    required this.vocabIdList,
  });

  @override
  State<LessonVocabInfo> createState() => _LessonVocabInfoState();
}

class NextOrPreviousVocab {
  final String name;
  final String desc;
  final String post_url;

  NextOrPreviousVocab({
    required this.name,
    required this.desc,
    required this.post_url,
  });

  factory NextOrPreviousVocab.fromJson(Map<String, dynamic> json) {
    return NextOrPreviousVocab(
      name: json['name'],
      desc: json['desc'],
      post_url: json['post_url'],
    );
  }
}

class _LessonVocabInfoState extends State<LessonVocabInfo> {
  bool isFavorite = false;
  late int currentIndex;
  late Future<NextOrPreviousVocab> currentVocab;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.vocabIdList.indexOf(widget.id);
    currentVocab = getCurrentlyVocab();
  }

  void navigateToVocab(int index) async {
    if (index >= 0 && index < widget.vocabIdList.length) {
      int vocabId = widget.vocabIdList[index];
      NextOrPreviousVocab newVocab = await getNextorPreviousVocab(vocabId);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LessonVocabInfo(
            id: widget.vocabIdList[index],
            categoryName: widget.categoryName,
            vocabName: newVocab.name,
            gif: newVocab.post_url,
            description: newVocab.desc,
            vocabIdList: widget.vocabIdList,
          ),
        ),
      );
    }
  }

  Future<NextOrPreviousVocab> getCurrentlyVocab() async {
    final apiURL = "http://10.0.2.2:8000/handpose/getbyid/${widget.id}";
    final response = await http.get(
      Uri.parse(apiURL),
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return NextOrPreviousVocab.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load vocab data');
    }
  }

  Future<NextOrPreviousVocab> getNextorPreviousVocab(int vocabId) async {
    final apiURL = "http://10.0.2.2:8000/handpose/getbyid/$vocabId";
    final response = await http.get(
      Uri.parse(apiURL),
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return NextOrPreviousVocab.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load vocab data');
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
      size: 30,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: FutureBuilder<NextOrPreviousVocab>(
        future: currentVocab,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: null);
          } else {
            final vocab = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  MyAppBar(
                    Topic: widget.categoryName,
                    onBackButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(37.0),
                    child: Image(
                      image: NetworkImage(vocab.post_url),
                      width: 340,
                      height: 200,
                    ),
                  ),
                  Container(
                    width: 345,
                    height: 360,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 30.0),
                              child: Text(
                                vocab.name,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFA86944),
                                ),
                              ),
                            ), // Adjust the width as needed
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                icon: icon,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            vocab.desc,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFA86944),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (currentIndex > 0)
                          ElevatedButton(
                            onPressed: () {
                              navigateToVocab(currentIndex - 1);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFFFF5D5)),
                              shadowColor:
                                  MaterialStateProperty.all(Color(0xFFA86944)),
                            ),
                            child: Text(
                              'Previous',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(
                                    0xFFA86944), // Set the text color here
                              ),
                            ),
                          ),
                        if (currentIndex < widget.vocabIdList.length - 1)
                          ElevatedButton(
                            onPressed: () {
                              navigateToVocab(currentIndex + 1);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFA86944)),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(
                                    0xFFFFFCD2), // Set the text color here
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
