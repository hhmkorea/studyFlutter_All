import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    UserController u = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원 번호 : ${u.user.value.id}"),
            Text("회원 이름 : ${u.user.value.username}"),
            //Text("회원 암호 : ${u.user.value. password}"), // null로 보임.
            Text("회원 이메일 : ${u.user.value.email}"),
            Text("회원 가입날짜 : ${u.user.value.created}"),
          ],
        ),
      ),
    );
  }
}
