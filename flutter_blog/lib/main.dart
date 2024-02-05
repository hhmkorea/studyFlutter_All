import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // GetX 사용할때 이렇게 감싸야함.
      debugShowCheckedModeBanner: false,
      // 라우트 설계는 차후 GetX 라이브러리로 사용
      home: LoginPage(),
    );
  }
}
