import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tab_screen_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  final _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
  bool currentMode = true;
  void onChangeMode(bool initialMode) {
    setState(() {
      initialMode = !initialMode;
      currentMode = !currentMode;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: currentMode ? _lightTheme : _darkTheme,
      home: TabsScreen(onChangeMode: onChangeMode ,currentMode:currentMode ),
    );
  }
}
