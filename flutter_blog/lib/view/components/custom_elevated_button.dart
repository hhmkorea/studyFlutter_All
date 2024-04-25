import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final funPageRoute; // 페이지 이동 라우터

  const CustomElevatedButton({required this.text, this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // 가로 최대한, 세로 50 사이즈
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // 테두리 원형
          ),
          backgroundColor: Colors.lightBlue, // 버튼색 넣음.
          foregroundColor: Colors.white),
      onPressed: funPageRoute,
      child: Text("$text"),
    );
  }
}
