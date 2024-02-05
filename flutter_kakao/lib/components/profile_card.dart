import 'package:flutter_kakao/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/profile_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(user: user), // 1
          ),
        );
      },
      child: Container( // 간격 수정 3
        height: 81,
        child: ListView( // 간격 수정 2
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero, // 간격 수정 1
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  user.backgroundImage,
                ),
              ),
              title: Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                user.intro,
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
