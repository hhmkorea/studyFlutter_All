import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {

  final String text;
  final String time;

  const MyChat({Key? key, required this.text, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), //EdgeInsets.all(8),  // 간격 수정
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Color(0xFFfeec34),
              ),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
