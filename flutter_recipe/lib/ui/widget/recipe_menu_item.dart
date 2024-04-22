import 'package:flutter/material.dart';

class RecipeMenuItem extends StatelessWidget {
  final mText;
  final mIcon;

  RecipeMenuItem({required this.mText, required this.mIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(mIcon.food_bank, color: Colors.redAccent),
          SizedBox(height: 5),
          Text("$mText", style: TextStyle(color: Colors.black87)),
          // 문자열 변수는 $를 앞에 넣어주는게 좋음.
        ],
      ),
    );
  }
}
