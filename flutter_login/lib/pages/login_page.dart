import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SvgPicture.asset(
            "assets/logo.svg",
            height: 80,
            width: 70,
          ),
        ],
      ),
    );
  }
}
