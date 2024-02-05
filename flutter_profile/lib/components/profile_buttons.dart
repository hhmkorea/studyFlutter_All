import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFollowButton(),
        _buildMessageButton(),
      ],
    );
  }

  Widget _buildFollowButton() {
    return InkWell(
      onTap: () {
        print("Follow 버튼 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: const Text(
          "Follow",
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildMessageButton() {
    return InkWell(
      onTap: () {
        print("Message 버튼 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: const Text(
          "Message",
          style: TextStyle(color: Colors.black), // 버튼 글자 색 수정
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          /*
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 9.0,
              spreadRadius: 0.0,
              offset: Offset(0,7),
            ),
          ],*/
          // 그림자 효과
          //border: Border.all(), // 테두리 있으면 버튼 글자 안보여서 주석처리.
        ),
      ),
    );
  }
}
