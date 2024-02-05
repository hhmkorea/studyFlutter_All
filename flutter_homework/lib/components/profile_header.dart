import 'package:flutter/material.dart';
import 'package:flutter_homework/components/profile_buttons.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // 1
      children: [
        const SizedBox(width: 20),
        _buildHeaderAvatar(),
        const SizedBox(width: 10),
        _buildHeaderProfile(),
        const Spacer(),
        const ProfileButtons(),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildHeaderAvatar() {
    return const SizedBox(
      width: 40,
      height: 40,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/avatar.png"),
      ),
    );
  }

  Widget _buildHeaderProfile() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "한현미",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "반갑습니다. 함께 TODO해요!",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
