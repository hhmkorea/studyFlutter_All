import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/pages/recipe/widget/recipe_menu.dart';
import 'package:flutter_recipe/ui/pages/recipe/widget/recipe_title.dart';
import 'package:flutter_recipe/ui/widget/recipe_list_item.dart';

class RecipeBody extends StatelessWidget {
  const RecipeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          RecipeTitle(),
          RecipeMenu(),
          RecipeListItem(mImageName: "coffee", mTitle: "Made Coffee"),
          RecipeListItem(mImageName: "burger", mTitle: "Made Burger"),
          RecipeListItem(mImageName: "pizza", mTitle: "Made Pizza"),
        ],
      ),
    );
  }
}
