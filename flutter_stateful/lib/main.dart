import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // StatefulWidget : 상태를 가질 수 있음,
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 1; // 상태,  부모 상태가 변경이 되면 자식 build도 모두 실행됨.

  // 행위 (행위를 통해서 상태가 변경될 때, 상태를 가지고 있는 자식 컴포넌트를 다시 그려줘야 한다.)
  void increase() {
    setState(() {
      number = number + 1;
      print("Hompage의 number: $number");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(child: Header(number)),
              Expanded(child: Bottom(increase)),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  int number;

  Header(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    print("Header Rendering...");
    return Center(
      child: Text(
        "$number",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 100,
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  final increase;

  Bottom(this.increase, {super.key});

  @override
  Widget build(BuildContext context) {
    print("Bottom Rendering...");
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: increase,
      child: Align(
        child: Text(
          "증가",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
