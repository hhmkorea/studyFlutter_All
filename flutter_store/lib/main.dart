import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea( // 가리지 않는 안전한 지역으로 body 위치함.
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Woman", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Kids", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Shoes", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Bag", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
