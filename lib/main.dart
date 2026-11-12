import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/Splash_Screen.dart';
import 'package:mobile_project/Services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // قراءة حالة الدارك مود المحفوظة في الهاتف قبل تشغيل التطبيق
  bool savedTheme = await ThemeService.getTheme();
  runApp(MobileApp(initialTheme: savedTheme));
}

class MobileApp extends StatefulWidget {
  final bool initialTheme;

  const MobileApp({super.key, required this.initialTheme});

  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialTheme;
  }

  //  تغيير المود وحفظه في الهاتف
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
      home: Splashscreen(
        isDarkMode: _isDarkMode,
        onThemeChanged: _updateTheme,
      ),
    );
  }
}
