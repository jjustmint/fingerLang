import 'package:flutter/material.dart';
import 'package:frontend/pages/auth/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/pages/lesson/lesson.dart';
import 'package:frontend/pages/profile/profile.dart';
import 'package:frontend/pages/home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    if (token.isNotEmpty) {
      setState(() {
        _isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLogin) {
      return Login();
    } else {
      return const MainAppContent();
    }
  }
}

class MainAppContent extends StatefulWidget {
  const MainAppContent({super.key});

  @override
  _MainAppContentState createState() => _MainAppContentState();
}

class _MainAppContentState extends State<MainAppContent> {
  int _selectedPage = 0;

  final List<Widget> _pages = const <Widget>[
    HomePage(),
    LessonPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 16, // Adjust selected font size
        unselectedFontSize: 16,
        backgroundColor: const Color(0xFFCC8459),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFCFCDAC),
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
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
  }
}