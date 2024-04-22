import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/theme.dart';
import 'package:flutter_recipe/ui/pages/recipe/recipe_page.dart';

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
      home: RecipePage(),
    );
  }
}
