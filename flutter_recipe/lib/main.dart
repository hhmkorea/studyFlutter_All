import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/theme.dart';
import 'package:flutter_recipe/ui/widget/recipe_menu_item.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Recipes", style: TextStyle(fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    RecipeMenuItem(mIcon: Icons.food_bank, mText: "ALL"),
                    SizedBox(width: 25),
                    RecipeMenuItem(mIcon: Icons.emoji_food_beverage, mText: "coffee"),
                    SizedBox(width: 25),
                    RecipeMenuItem(mIcon: Icons.fastfood, mText: "Buger"),
                    SizedBox(width: 25),
                    RecipeMenuItem(mIcon: Icons.local_pizza, mText: "Pizza"),
                  ],
                ),
              ),
              Column(
                children: [],
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
            ],
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.red),
        SizedBox(width: 15),
      ],
    );
  }
}
