import 'package:flutter/material.dart';
import 'package:frontend/pages/home/VocabList.dart';

class categoryCard extends StatelessWidget {
  String CategoryName;
  String CategoryImage;
  int id;
  categoryCard({
    super.key,
    required this.CategoryName,
    required this.CategoryImage,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfoCategory(
                    categoryName: CategoryName,
                    id: id,
                  )),
        );
      },
      child: Container(
        //category card
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 21, bottom: 30),
              child: Text(CategoryName,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFA86944))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 9, left: 256, right: 20, bottom: 8),
              child: Image.network(
                CategoryImage,
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
