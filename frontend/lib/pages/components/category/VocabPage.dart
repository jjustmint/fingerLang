import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/components/MyAppBar.dart';
import 'package:frontend/pages/home/categoryCard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Vocab extends StatefulWidget {
  final String categoryName;
  final String vocabName;
  final String gif;
  final String description;
  final int id;

  Vocab({
    super.key,
    required this.categoryName,
    required this.vocabName,
    required this.gif,
    required this.description,
    required this.id,
  });

  @override
  State<Vocab> createState() => _VocabState();
}

class _VocabState extends State<Vocab> {
  bool isFavorite = false;

  void initState() {
    checkFavorite();
    super.initState();
  }

  Future<void> checkFavorite() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      final apiUrl = 'http://10.0.2.2:8000/profile/getfavorite/$token';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        List<dynamic> favorites = parsedResponse['Favorite'];

        // Check if widget.id is in the list of favorites
        bool found =
            favorites.any((favorite) => favorite['post_id'] == widget.id);

        setState(() {
          isFavorite = found;
        });
        print('Favorites loaded: $favorites');
      } else {
        print('Failed to load favorites: ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR: $e');
    }
  }

  void createFavorite() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      final apiUrl = 'http://10.0.2.2:8000/profile/addfavorite';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'token': token,
          'postId': widget.id,
        }),
      );
      if (response.statusCode == 200) {
        print('Favorite added');
      } else {
        print('Failed to add favorite: ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR: $e');
    }
  }

  void deleteFavorite() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      final apiUrl = 'http://10.0.2.2:8000/profile/deletefavorite';
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'token': token,
          'postId': widget.id,
        }),
      );
      if (response.statusCode == 200) {
        print('Favorite deleted');
      } else {
        print('Failed to delete favorite: ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
      size: 30,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCD2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              Topic: widget.categoryName,
              onBackButtonPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(37.0),
              child: Image(
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 340,
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                image: NetworkImage("${widget.gif}"),
                width: 340,
                height: 200,
              ),
            ),
            Container(
              width: 345,
              height: 420,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 30.0),
                        child: Text(
                          widget.vocabName,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFA86944),
                          ),
                        ),
                      ), // Adjust the width as needed
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: IconButton(
                          onPressed: () {
                            if (isFavorite == false) {
                              createFavorite();
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            } else if (isFavorite == true) {
                              deleteFavorite();
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            }
                          },
                          icon: icon,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFA86944),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
