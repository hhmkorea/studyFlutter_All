import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/widget/recipe_menu_item.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
