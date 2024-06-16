import 'package:flutter/material.dart';

class AlphabetCard extends StatelessWidget {
  final String alphabet;
  const AlphabetCard({super.key, required this.alphabet});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 89,
        width: 89,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5D5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Image.network(alphabet));
  }
}
