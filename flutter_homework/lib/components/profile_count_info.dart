import 'package:flutter/material.dart';

class ProfileCountInfo extends StatelessWidget {
  const ProfileCountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffeeeeee)
        ),
        //color: Color(0xFFebdef0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInfo("150", "팔로잉"),
            _buildLine(),
            _buildInfo("999", "팔로워"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String count, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55, top: 17, bottom: 17),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            count,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
        width: 2,
        height: 25,
        color: Colors.grey[300],
    );
  }
}
