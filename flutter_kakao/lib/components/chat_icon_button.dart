import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {

  final Icon icon;

  const ChatIconButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 15),
      onPressed: () {},
      icon: icon,
      iconSize: 25,
    );
  }
}
