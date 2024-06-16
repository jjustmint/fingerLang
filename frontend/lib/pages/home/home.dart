import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/home/HomeAppBar.dart';
import 'package:frontend/pages/home/categoryCard.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class MyCategories {
  final String name;
  final String image;
  final int id;
  MyCategories({
    required this.name,
    required this.image,
    required this.id,
  });

  factory MyCategories.fromJson(Map<String, dynamic> json) {
    return MyCategories(
      name: json['categories_name'],
      image: json['image_url'],
      id: json['id'],
    );
  }
}

class _HomePageState extends State<HomePage> {
  List<MyCategories> categories = [];
  @override
  void initState() {
    getCategory();
    super.initState();
  }

  void getCategory() async {
    try {
      final apiURL = 'http://10.0.2.2:8000/category/getcategory';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('getCategory');
        setState(() {
          categories = parseCategory(response.body);
        });
        print('Categories: $categories');
      } else {
        print('Failed to load category data');
      }
    } catch (e) {
      print('ERROR: $e');
    }
  }

  List<MyCategories> parseCategory(String body) {
    try {
      List<dynamic> jsonData = jsonDecode(body);
      return jsonData.map((data) => MyCategories.fromJson(data)).toList();
    } catch (e) {
      print('Error parsing JSON: $e');
      return [];
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            CategorySection(
              categories: categories,
            )
          ],
        ),
      ), // Set background color
    );
  }
}

class CategorySection extends StatelessWidget {
  List<MyCategories> categories = [];
  CategorySection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27.0, left: 19.0, right: 19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categories',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black)), // Adjust the height as needed
          ListView.builder(
            itemCount: categories.length,
            padding: const EdgeInsets.only(
                top: 24), // Adjust the number of categories as needed
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: categoryCard(
                  CategoryName: categories[index].name,
                  CategoryImage: categories[index].image,
                  id: categories[index].id,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
