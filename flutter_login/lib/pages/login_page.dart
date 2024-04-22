import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // 왼쪽 정렬
        children: [
          Logo("Login"),
        ],
      ),
    );
  }
}
