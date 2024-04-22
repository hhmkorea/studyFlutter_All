import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';
import 'package:flutter_login/components/custom_form.dart';
import 'package:flutter_login/size.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // 왼쪽 정렬, 하단에 키보드가 떠도 여기 영역은 상단에 고정됨.
          children: [
            SizedBox(height: xlarge_gap),
            Logo("Login"),
            SizedBox(height: large_gap),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
