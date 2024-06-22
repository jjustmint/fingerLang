import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/mainScreen.dart';
import 'package:frontend/pages/auth/signup/signup.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  String errorMessage = '';

  double textFieldHeight = 50.0;

  void toggleObscure() {
    setState(() {
      _isObscure = !_isObscure; // Toggle password visibility
    });
  }

  String parseToken(String responseBody) {
    try {
      var jsonResponse = jsonDecode(responseBody);
      if (jsonResponse['token'] != null) {
        return jsonResponse['token'];
      } else {
        return '';
      }
    } catch (e) {
      print('Error parsing JSON: $e');
      return '';
    }
  }

  void login() async {
    try {
      final apiURL = 'http://10.0.2.2:8000/auth/login';
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        var response = await http.post(Uri.parse(apiURL),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, dynamic>{
              "username": _usernameController.text,
              "password": _passwordController.text,
            }));
        if (response.statusCode == 200) {
          print('Login successfully');
          final mytoken = parseToken(response.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token",mytoken);
          print(prefs.getString("token"));
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(
                    )),
          );
        } else {
          setState(() {
            errorMessage = 'Incorrect username or password';
          });
          print('Failed to login: ${response.body}');
          showErrorDialog('Login Failed', 'Incorrect username or password');
        }
      } else {
        showErrorDialog('Empty Fields', 'Please fill in all fields to proceed with login.');
      }
    } catch (e) {
      print('ERROR: $e');
      print(_usernameController.text);
      print(_passwordController.text);
      showErrorDialog('Login Error', 'An error occurred during login. Please try again.');
    }
  }

  void showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _navigateToSignupPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCC8459),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.09,
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFFFFFCD2).withOpacity(1),
                              const Color(0xFFFFFCD2).withOpacity(0.0),
                            ],
                            stops: [0.4, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Image.asset(
                        'assets/images/fingerlang_Light_ver.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'FINGERLANG',
                  style: TextStyle(
                    color: Color(0xFFFFFCD2),
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Handle back action
                Navigator.pop(context); // Example: navigate back to previous screen
              },
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.38,
              decoration: BoxDecoration(
                color: Color(0xFFFFFCD2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Colors.black12,
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.black12,
                        hintStyle: TextStyle(color: Colors.black54),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                          onPressed: toggleObscure,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          _navigateToSignupPage(context);
                        },
                        child: const Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(
                            color: Colors.black87,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
