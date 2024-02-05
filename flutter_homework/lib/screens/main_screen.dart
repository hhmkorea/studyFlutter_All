import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/screens/mypage_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          MypageScreen(),
          MypageScreen(),
          MypageScreen(),
          MypageScreen(),
          MypageScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xffdadada), width: 2), // 분리선
          ),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.grey[100],
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: const Color(0xffbcbcbc),
          //iconSize: 20,
          unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble),
              label: "채팅",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plusSquare),
              label: "글쓰기",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "검색",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "MY",
            ),
          ],
        ),
      ),
    );
  }
}
