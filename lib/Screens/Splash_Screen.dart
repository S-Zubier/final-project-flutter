/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const HomeScreen1(

            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Image.asset(
                'assets/images/logoshop.png',
                width: 500,
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome To Your Store',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 100),
              const CircularProgressIndicator(
                color: Colors.lightGreen,
              )
            ],
          ),
        ),
      ),
    );
  }
} */// make by me

//
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';

class Splashscreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const Splashscreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      // استخدام pushReplacement لمنع الرجوع لشاشة السبلاش مرة أخرى
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen1(
            isDarkMode: widget.isDarkMode,
            onThemeChanged: widget.onThemeChanged,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تغيير لون الخلفية تلقائياً حسب الدارك مود
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logoshop.png',
                width: 250,
                height: 200,
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome To Your Store',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 60),
              const CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}







