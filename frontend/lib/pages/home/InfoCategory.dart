import 'package:flutter/material.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:frontend/pages/components/category/AlphabetCard.dart';
import 'package:frontend/pages/components/category/NormalCard.dart';
import 'package:frontend/pages/components/category/VocabPage.dart';

class InfoCategory extends StatefulWidget {
  final String categoryName;
  InfoCategory({super.key, required this.categoryName});

  @override
  State<InfoCategory> createState() => _InfoCategoryState();
}

class _InfoCategoryState extends State<InfoCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              Topic: widget.categoryName,
            ),
            if (widget.categoryName == "Alphabet")
              AlphabetList(
                categoryName: widget.categoryName,
              )
            else
              NormalList(
                categoryName: widget.categoryName,
              ),
          ],
        ),
      ),
    );
  }
}

class NormalList extends StatelessWidget {
  String categoryName;
  NormalList({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 6, // Adjust the number of categories as needed
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
                      vocabName: "word" + " " + '${index + 1}',
                      gif: "assets/images/abc.png",
                      description: "This is a description",
                    ),
                  ),
                );
              },
              child: NormalCard(
                word: "word" + " " + '${index + 1}',
              ),
            );
          },
        ),
      ],
    );
  }
}

class AlphabetList extends StatelessWidget {
  String categoryName;
  AlphabetList({super.key, required this.categoryName});

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
        26,
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
                        vocabName: "Alphabet" + " " + '${index + 1}',
                        gif: "assets/images/abc.png",
                        description: "This is a description",
                      ),
                    ),
                  );
                },
                child: AlphabetCard()),
          );
        },
      ),
    );
  }
}
