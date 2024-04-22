import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final String mTitle;
  final String mImageName;

  const RecipeListItem({required this.mImageName, required this.mTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            // 실제로 이미지를 깎음.
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Image.asset("assets/images/$mImageName.jpeg", fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10),
          Text("$mTitle", style: TextStyle(fontSize: 20)),
          Text("Have you ever made your own $mTitle? Once you've tried a homemade $mTitle, you'll never go back.",
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
