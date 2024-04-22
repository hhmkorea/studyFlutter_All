import 'package:flutter/material.dart';
import 'package:flutter_login/components/Logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Logo("Care Soft"),
        ],
      ),
    );
  }
}
