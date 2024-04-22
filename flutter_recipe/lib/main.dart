import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Scaffold(
        appBar: appbar(),
        body: ListView(
          children: [
            Placeholder(fallbackHeight: 50),
            Row(
              children: [
                Placeholder(fallbackWidth: 50, fallbackHeight: 80),
                Placeholder(fallbackWidth: 50, fallbackHeight: 80),
                Placeholder(fallbackWidth: 50, fallbackHeight: 80),
                Placeholder(fallbackWidth: 50, fallbackHeight: 80),
              ],
            ),
            Column(
              children: [
                Placeholder(fallbackHeight: 80),
                Placeholder(fallbackHeight: 30),
                Placeholder(fallbackHeight: 50),
              ],
            ),
            Column(
              children: [
                Placeholder(fallbackHeight: 80),
                Placeholder(fallbackHeight: 30),
                Placeholder(fallbackHeight: 50),
              ],
            ),
            Column(
              children: [
                Placeholder(fallbackHeight: 80),
                Placeholder(fallbackHeight: 30),
                Placeholder(fallbackHeight: 50),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: Text("안녕"),
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.red),
        SizedBox(width: 15),
      ],
    );
  }
}
