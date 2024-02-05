import 'package:flutter/material.dart';
import 'package:flutter_kakao/models/chat.dart';
import 'package:flutter_kakao/screens/chat_room_screen.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatRoomScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20), // 간격 수정
        //const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(chat.image),
                ),
                title: Text(chat.title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                subtitle: Text(chat.content),
              ),
            ),
            Column(
              children: [
                Text(chat.time, style: TextStyle(color: Color(0xFFa5a5a5), fontSize: 12),
                ),
                SizedBox(height: 5),
                /*if (chat.count != "0") {
                  return Container(); // Container를 리턴 못함. 아래처럼 이항연산자 사용!!
                }*/
                chat.count != "0" ?
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFde6344),
                  ),
                  child: Text(
                    chat.count,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ) : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

