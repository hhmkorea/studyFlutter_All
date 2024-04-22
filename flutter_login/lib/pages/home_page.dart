import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 200),
            Logo("Care Soft"),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // 이전 페이지로 이동, stack 형태로 쌓인걸 맨 위에 있는걸 pop으로 치움. push는 쌓는것.
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
