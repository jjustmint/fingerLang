import 'package:flutter/material.dart';
import 'package:frontend/pages/home/Textbox.dart';

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
                    Container( //category card
                      height: 97,
                      width: 358,
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
                      child: Row(
                        children: [
                          Text('Alphabet',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFA86944))),
                        
                        ],
                      ),
                    ),
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

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 273,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        color: Color(0xFFCC8459),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 102),
            child: Center(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFFFCD2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
