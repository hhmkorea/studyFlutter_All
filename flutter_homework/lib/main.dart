import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
