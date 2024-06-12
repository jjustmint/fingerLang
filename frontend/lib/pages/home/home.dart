import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/home/HomeAppBar.dart';
import 'package:frontend/pages/home/Textbox.dart';
import 'package:frontend/pages/home/TopBar.dart';
import 'package:frontend/pages/home/categoryCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [HomeAppBar(), CategorySection()],
        ),
      ), // Set background color
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
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
            itemCount: 6,
            padding: const EdgeInsets.only(
                top: 24), // Adjust the number of categories as needed
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: categoryCard(),
              );
            },
          ),
        ],
      ),
    );
  }
}
