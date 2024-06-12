import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/pages/lesson/lesson.dart';
import 'package:frontend/pages/onboarding/onboarding.dart';
import 'package:frontend/pages/profile/profile.dart';
import 'package:frontend/pages/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showOnboarding = true;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
    _showOnboarding;
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingComplete = prefs.getBool('onboardingComplete') ?? true;

    if (onboardingComplete) {
      setState(() {
        _showOnboarding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showOnboarding) {
      return OnboardingPage(
        onFinish: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('onboardingComplete', true);
          setState(() {
            _showOnboarding = false;
          });
        },
      );
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

// class OnboardingPage extends StatelessWidget {
//   final VoidCallback onFinish;

//   const OnboardingPage({required this.onFinish, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Welcome to the Onboarding Page'),
//             ElevatedButton(
//               onPressed: onFinish,
//               child: Text('Finish Onboarding'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
