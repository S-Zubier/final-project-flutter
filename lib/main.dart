
/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/ProductScreen.dart';
import 'package:mobile_project/Screens/Splash_Screen.dart';
import 'package:mobile_project/Screens/home.dart';
import 'package:mobile_project/Screens/example.dart';

import 'package:mobile_project/Screens/loginSecreen.dart';

import 'package:mobile_project/Screens/profilePage.dart';
import 'package:mobile_project/Screens/signUpScreen.dart';

import 'Screens/CartScreen.dart';

void main (){
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home:HomeScreen1() ,
  ));
}*/

/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/home.dart';
import 'package:mobile_project/Services/theme_service.dart';
//import 'package:mobile_project/Services/theme_service.dart'; // تأكدي من وجود هذا الملف ومساره الصحيح

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // قراءة حالة الثيم المحفوظة في الهاتف قبل بدء التطبيق
  bool savedTheme = await ThemeService.getTheme();

  runApp(MyApp(initialTheme: savedTheme));
}

class MyApp extends StatefulWidget {
  final bool initialTheme;
  const MyApp({super.key, required this.initialTheme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',

      // التحكم بالثيم العام للتطبيق بناءً على الاختيار
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // إعدادات الوضع الفاتح (Light Mode)
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
        ),
      ),

      // إعدادات الوضع الداكن (Dark Mode)
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
          surface: Colors.black,
        ),
      ),

      home: const HomeScreen1(),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/Splash_Screen.dart';
import 'package:mobile_project/Screens/home.dart';
import 'package:mobile_project/Services/theme_service.dart';

import 'Screens/profilePage.dart';
import 'Screens/settingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1. قراءة الثيم المحفوظ من الهاتف قبل تشغيل التطبيق
  bool savedTheme = await ThemeService.getTheme();
  runApp(MyApp(initialTheme: savedTheme));
}

class MyApp extends StatefulWidget {
  final bool initialTheme;
  const MyApp({super.key, required this.initialTheme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    // 2. تعيين الثيم بناءً على القيمة المسترجعة من الذاكرة
    _isDarkMode = widget.initialTheme;
  }

  // 3. الدالة المسؤولة عن التغيير اللحظي والحفظ في الهاتف معاً
  void _updateTheme(bool value) async {
    setState(() {
      _isDarkMode = value; // تحديث لحظي للواجهة
    });
    await ThemeService.saveTheme(value); // حفظ التغيير في الهاتف فوراً
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, brightness: Brightness.light),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreen, foregroundColor: Colors.white),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, brightness: Brightness.dark, surface: Colors.black),
      ),

      home:

       //Splashscreen(),
      HomeScreen1
        (
       isDarkMode: _isDarkMode,
        onThemeChanged: _updateTheme, // تمرير دالة الحفظ والتحديث لشاشة الهوم
     ),
    );
  }
}*/


////

import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/Splash_Screen.dart';
import 'package:mobile_project/Services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // قراءة حالة الدارك مود المحفوظة في الهاتف قبل تشغيل التطبيق
  bool savedTheme = await ThemeService.getTheme();
  runApp(MyApp(initialTheme: savedTheme));
}

class MyApp extends StatefulWidget {
  final bool initialTheme;
  const MyApp({super.key, required this.initialTheme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialTheme;
  }

  // دالة تغيير الثيم وحفظه في الهاتف
  void _updateTheme(bool value) async {
    setState(() {
      _isDarkMode = value;
    });
    await ThemeService.saveTheme(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // ثيم الوضع النهاري
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
        ),
      ),

      // ثيم الوضع الليلي
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
          surface: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
        ),
      ),

      // البدء من شاشة السبلاش وتمرير بيانات الثيم لها
      home: Splashscreen(
        isDarkMode: _isDarkMode,
        onThemeChanged: _updateTheme,
      ),
    );
  }
}

