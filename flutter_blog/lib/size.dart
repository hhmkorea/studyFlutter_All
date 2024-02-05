
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context){ // 화면 전체 넓이
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context){ // 도로우 메뉴 넓이
  return getScreenWidth(context) * 0.6;
}