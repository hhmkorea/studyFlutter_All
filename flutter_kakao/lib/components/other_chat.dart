
import 'package:flutter/material.dart';
import 'package:flutter_kakao/models/user.dart';

class OtherChat extends StatelessWidget {

  final String name;
  final String text;
  final String time;

  const OtherChat({Key? key, required this.name, required this.text, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.5),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(friends[0].backgroundImage),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8), // EdgeInsets.all(8) // 간격 수정
                  child: Text(text),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Text(
            time,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
