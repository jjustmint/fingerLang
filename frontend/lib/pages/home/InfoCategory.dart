import 'package:flutter/material.dart';
import 'package:frontend/pages/components/MyAppBar.dart';

class InfoCategory extends StatelessWidget {
  String categoryName;
  InfoCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            Topic: categoryName,
          )
        ],
      ),
    );
  }
}
