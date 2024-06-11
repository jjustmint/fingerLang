import 'package:flutter/material.dart';
import 'package:frontend/pages/onboarding/onboarding.dart';
import 'package:frontend/pages/profile/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = 0;
    final List<Widget> pages = <Widget>[
      const HomePage(),
      const LessonPage(),
      const ProfilePage(),
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          body: pages[selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            selectedFontSize: 16, // Adjust selected font size
            unselectedFontSize: 16,
            backgroundColor: const Color(0xFFCC8459),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFFCFCDAC),
            currentIndex: selectedPage,
            onTap: (int index) {
              selectedPage = index;
              (context as Element).markNeedsBuild();
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Lesson',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      }),
    );
  }
}
