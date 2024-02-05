import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildEditProfileButton(),
      ],
    );
  }
  Widget _buildEditProfileButton() {
    return InkWell(
      onTap: () {
        print("프로필 수정 버튼 클릭됨");
      },
      child: OutlinedButton(
          onPressed: null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          child: const Text(
            "프로필 수정",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
      ),
    );
  }
}
