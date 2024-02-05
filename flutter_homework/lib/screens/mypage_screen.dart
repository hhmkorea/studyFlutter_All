import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/components/profile_count_info.dart';
import 'package:flutter_homework/components/profile_header.dart';
import 'package:flutter_homework/components/profile_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileAppBar(), // 상단 웹바.
      body: Column(
        children: [
          const SizedBox(height: 23),
          const ProfileHeader(),
          const ProfileCountInfo(),
          Expanded(child: ProfileTab()),
        ],
      ),
    );
  }

  AppBar _buildProfileAppBar() { // 과제2 : AppBar를 사용하여 title과 action 구현
    return AppBar(
      title: const Text(
        "마이페이지",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        _buildAlertBell(),
        const SizedBox(width: 5),
        const Icon(CupertinoIcons.gear, size: 20),
        const SizedBox(width: 25),
      ],
      //centerTitle: false,
    );
  }

  Container _buildAlertBell() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 7),
            child: Icon(FontAwesomeIcons.bell, size: 20),
          ),
          Positioned(
            left: 12,
            top: 5,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFde6344),
                ),
                constraints: const BoxConstraints(
                  minWidth: 15,
                  minHeight: 15,
                ),
                child: const Text(
                  "3",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
