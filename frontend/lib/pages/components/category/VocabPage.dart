import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:frontend/pages/home/categoryCard.dart';

class Vocab extends StatefulWidget {
  final String categoryName;
  final String vocabName;
  final String gif;
  final String description;

  Vocab({
    super.key,
    required this.categoryName,
    required this.vocabName,
    required this.gif,
    required this.description,
  });

  @override
  State<Vocab> createState() => _VocabState();
}

class _VocabState extends State<Vocab> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
      size: 30,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              Topic: widget.categoryName,
            ),
            Padding(
              padding: const EdgeInsets.all(37.0),
              child: Image(
                image: AssetImage(widget.gif),
                width: 340,
                height: 200,
              ),
            ),
            Container(
              width: 345,
              height: 345,
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
                        padding: const EdgeInsets.only(top: 18.0, left: 30.0),
                        child: Text(
                          widget.vocabName,
                          style: TextStyle(
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
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFA86944),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
