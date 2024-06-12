import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                TopBar(),
                HomeTextBox(),
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 27.0, left: 19.0, right: 19.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Categories',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    SizedBox(
                      height: 20,
                    ),
                    categoryCard(),
                    SizedBox(
                      height: 20,
                    ),
                    categoryCard(),
                    SizedBox(
                      height: 20,
                    ),
                    categoryCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ), // Set background color
    );
  }
}
