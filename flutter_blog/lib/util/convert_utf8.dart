/*
// convert_utf8.dart
// 41강 한글 깨지는거 utf-8 변환부분인데 깨지지 않아서 할 필요 없음.

import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body) {
  // jsonDecode로 바로 못함... body에 code unit이 없어서 아래와 같이 처리.
  // dynamic이 아닌 String으로 body를 받을 경우 타입이 Linked Hash로 안맞아서 에러 발생.
  String responseBody = jsonEncode(body); // json 데이터로 변경
  dynamic converBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return converBody;
}*/
