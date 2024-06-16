import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/home/Textbox.dart';
import 'package:frontend/pages/home/TopBar.dart';

class lessonBar extends StatelessWidget {
  final bool recentLesson;
  const lessonBar({
    super.key,
    required this.recentLesson,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 273,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            color: Color(0xFFCC8459),
          ),
          child: Stack(
            children: [
              Image.asset('assets/images/book.png'),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Center(
                  child: Text(
                    'Lesson',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFA86944),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(66, -160),
          child: Container(
            // padding: EdgeInsets.only(bottom: 102),
            height: 262,
            width: 262,
            decoration: BoxDecoration(
              color: Color(0xFFFFFCD2),
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFFFCD2).withOpacity(1),
                  const Color(0xFFFFFCD2).withOpacity(0.0),
                ],
                stops: [0.3, 3.0],
              ),
            ),
          ),
        ),
        Center(
          child: Stack(
            children: [
              Container(
                height: 159,
                width: 361,
                margin: const EdgeInsets.only(top: 157),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFEEA),
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
                child: (recentLesson)
                    ? Padding(
                        padding:
                            EdgeInsets.only(top: 16.0, left: 27.0, right: 95.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lesson Name',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFA86944),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 50.0, top: 10.0),
                              child: Text(
                                'Beginner Level',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA86944),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 18.0, bottom: 20),
                          child: Text(
                            '“There are no recent lessons that you have learned yet.”',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFA86944),
                            ),
                          ),
                        ),
                      ),
              ),
              if (recentLesson)
                Padding(
                  padding: EdgeInsets.only(left: 218.0, top: 250.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF5491E)),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFFFCD2),
                        ),
                      ),
                    ),
                    child: Text('Continue'),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
