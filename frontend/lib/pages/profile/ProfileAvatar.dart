import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}


class _ProfileAvatarState extends State<ProfileAvatar> {
  // List of predefined images
  final List<String> _images = [
    'assets/images/Male1.png',
    'assets/images/Male2.png',
    'assets/images/Male3.png',
    'assets/images/Female1.png',
    'assets/images/Female2.png',
    'assets/images/Female3.png',
  ];

  // Index of the current selected image
  int _selectedIndex = 0;

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
            height: 300, // Increased the height to provide more space
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30), // Increased margin for more space
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
                                  radius:
                                      40, // Adjusted the radius for smaller profile pictures
                                  backgroundImage:
                                      AssetImage(_images[index]),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            left: -25, // Adjusted position for more space
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
                            right: -25, // Adjusted position for more space
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
                Navigator.of(context).pop();
                String selectedImageUrl = _images[_selectedIndex];
                //_updateUserProfile(selectedImageUrl);
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
              radius: 100, // Increased radius for the profile picture
              backgroundImage: AssetImage(_images[_selectedIndex]),
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
                    radius: 20, // Increased radius for the edit icon
                    backgroundColor: Color(0xFFCC8459),
                    child: Icon(Icons.edit, size: 25, color: Color(0xFFFFFCD2)), // Increased icon size
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
