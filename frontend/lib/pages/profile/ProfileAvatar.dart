import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileAvatar extends StatefulWidget {
  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final List<String> _images = [
    'Male1.png',
    'Male2.png',
    'Male3.png',
    'Female1.png',
    'Female2.png',
    'Female3.png',
  ];
  String profile = '';
  int _selectedIndex = 0;

  @override
  void initState() {
    getImage();
    super.initState();
  }

  void _updateUserProfile(String imageUrl) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        print('Error: Token is null');
        return;
      }
      final apiURL = 'http://10.0.2.2:8000/profile/updateProfileImage';
      final response = await http.post(Uri.parse(apiURL),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(<String, dynamic>{
            "token": token,
            "imageUrl": imageUrl,
          }));

      if (response.statusCode == 200) {
        print('User profile updated successfully');
        getImage();
        Navigator.of(context).pop();
      } else {
        print(
            'Failed to update user profile. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        print(imageUrl);
        print(token!);
      }
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  void getImage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        print('Error: Token is null');
        return;
      }
      final apiURL = 'http://10.0.2.2:8000/profile/getprofile/$token';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      setState(() {
        profile = jsonDecode(response.body)['image_url'];
      });
    } catch (e) {
      print('Error getting user profile: $e');
    }
  }

  void _openImageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int _tempSelectedIndex = _selectedIndex;
        PageController _pageController =
            PageController(initialPage: _tempSelectedIndex);

        return AlertDialog(
          title: Text('Select a Profile Picture'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: _images.length,
                            onPageChanged: (index) {
                              setState(() {
                                _tempSelectedIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _tempSelectedIndex == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 5,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                      'assets/images/${_images[index]}'),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            left: -25,
                            child: Visibility(
                              visible: _tempSelectedIndex > 0,
                              child: IconButton(
                                icon: Icon(Icons.arrow_left, size: 50),
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            right: -25,
                            child: Visibility(
                              visible: _tempSelectedIndex < _images.length - 1,
                              child: IconButton(
                                icon: Icon(Icons.arrow_right, size: 50),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = _tempSelectedIndex;
                });
                String selectedImageUrl = _images[_selectedIndex];
                _updateUserProfile(selectedImageUrl);
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/$profile'),
            ),
            Positioned(
              right: 15,
              bottom: 5,
              child: GestureDetector(
                onTap: _openImageSelectionDialog,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFCC8459),
                    child: Icon(Icons.edit, size: 25, color: Color(0xFFFFFCD2)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
