import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:frontend/pages/components/category/AlphabetCard.dart';
import 'package:frontend/pages/components/category/NormalCard.dart';
import 'package:frontend/pages/components/category/VocabPage.dart';
import 'package:http/http.dart' as http;

class InfoCategory extends StatefulWidget {
  final String categoryName;
  final int id;
  InfoCategory({super.key, required this.categoryName, required this.id});

  @override
  State<InfoCategory> createState() => _InfoCategoryState();
}

class Myvocab {
  final int id;
  final String image;
  final String name;
  final String post;
  final String desc;

  Myvocab({
    required this.name,
    required this.image,
    required this.id,
    required this.post,
    required this.desc,
  });

  factory Myvocab.fromJson(Map<String, dynamic> json) {
    return Myvocab(
      id: json['id'] ?? 0,
      image: json['image_url'] ?? '',
      name: json['name'] ?? '',
      post: json['post'] ?? '',
      desc: json['desc'] ?? '',
    );
  }
}

class _InfoCategoryState extends State<InfoCategory> {
  List<Myvocab> vocabs = [];
  @override
  void initState() {
    getVocabs();
    super.initState();
  }

  void getVocabs() async {
    try {
      final apiURL = 'http://10.0.2.2:8000/handpose/getbycategory/${widget.id}';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('getCategory');
        setState(() {
          vocabs = parseVocabs(response.body);
        });
        print('Categories: $vocabs');
      } else {
        print('Failed to load vocabs data');
      }
    } catch (e) {
      print('ERROR: $e');
    }
  }

  List<Myvocab> parseVocabs(String body) {
    try {
      List<dynamic> jsonData = jsonDecode(body);
      return jsonData.map((data) => Myvocab.fromJson(data)).toList();
    } catch (e) {
      print('Error parsing JSON: $e');
      return [];
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              Topic: widget.categoryName,
              onBackButtonPressed: () {
                Navigator.pop(context);
              },
            ),
            if (widget.categoryName == "Alphabets")
              AlphabetList(
                categoryName: widget.categoryName,
                vocabs: vocabs,
              )
            else
              NormalList(
                categoryName: widget.categoryName,
                vocabs: vocabs,
              ),
          ],
        ),
      ),
    );
  }
}

class NormalList extends StatelessWidget {
  List<Myvocab> vocabs = [];
  String categoryName;
  NormalList({super.key, required this.categoryName, required this.vocabs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: vocabs.length, // Adjust the number of categories as needed
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vocab(
                      categoryName: categoryName,
                      vocabName: vocabs[index].name,
                      gif: vocabs[index].image,
                      description: vocabs[index].desc,
                    ),
                  ),
                );
              },
              child: NormalCard(
                word: vocabs[index].name,
              ),
            );
          },
        ),
      ],
    );
  }
}

class AlphabetList extends StatelessWidget {
  final String categoryName;
  final List<Myvocab> vocabs;

  AlphabetList({super.key, required this.categoryName, required this.vocabs});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding:
          const EdgeInsets.only(left: 40.0, right: 40, bottom: 20, top: 40),
      crossAxisCount: 3, // Number of columns
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 1.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        vocabs.length, // Use the length of the vocabs list
        (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vocab(
                      categoryName: categoryName,
                      vocabName: vocabs[index].name,
                      gif: vocabs[index].image,
                      description: vocabs[index].desc,
                    ),
                  ),
                );
              },
              child: AlphabetCard(
                alphabet: vocabs[index].image,
              ), // Ensure AlphabetCard gets the correct parameter
            ),
          );
        },
      ),
    );
  }
}
