import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<dynamic> Favorites = [];
  @override
  void initState() {
    getFavorite();
    super.initState();
  }

  void getFavorite() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        print('Error: Token is null');
        return;
      }
      final apiURL = 'http://10.0.2.2:8000/profile/getfavorite/$token';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      setState(() {
        Favorites = jsonDecode(response.body)['Favorite'];
      });
      print('Favorite: $Favorites');
    } catch (e) {
      print('Error getting favorite profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFCD2),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Orange Square Container with Shadow
              Container(
                height: 157,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Color(0xFFCC8459),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background Circle
                    Positioned(
                      top: -160,
                      left: 60,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFCD2),
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Color(0xFFFFFCD2).withOpacity(1),
                              Color(0xFFFFFCD2).withOpacity(0.0),
                            ],
                            stops: [0.3, 1.0],
                          ),
                        ),
                      ),
                    ),
                    // Arrow Back Icon
                    Positioned(
                      top: 40, // Adjusted top position
                      left: 10, // Adjusted left position
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context,
                              '/frontend/lib/pages/profile/profile.dart');
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Title
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Favorites',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFFFFCD2),
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black45,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 180.0, left: 30.0, right: 30.0),
                child: FavoriteList(
                  Favorites: Favorites,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteList extends StatefulWidget {
  List<dynamic> Favorites = [];
  FavoriteList({Key? key, required this.Favorites}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  void initState() {
    getVocab();
    super.initState();
  }

  void getVocab() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        print('Error: Token is null');
        return;
      }
      final apiURL = 'http://10.0.2.2:8000/profile/getfavorite/$token';
      final response = await http.get(
        Uri.parse(apiURL),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      setState(() {
        // Add code to get vocab list
      });
    } catch (e) {
      print('Error getting vocab list: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Adjust the number of columns as per your design
        childAspectRatio: 4, // Adjust the aspect ratio (width / height)
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.Favorites.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          name: widget.Favorites[index]['name'],
        );
      },
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String name;
  FavoriteCard({Key? key, required this.name}) : super(key: key);
  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF5D5),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.3),
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            // Add more widgets if needed
          ],
        ),
      ),
    );
  }
}
