import 'package:flutter_blog/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int? id;
  final String? title;
  final String? content;
  final User? user;
  final DateTime? created;
  final DateTime? updated;

  Post({
    this.id,
    this.title,
    this.content,
    this.user,
    this.created,
    this.updated,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],                // 이니셜 라이즈드 연산자!!
        title = json["title"],
        content = json["content"],
        user = User.fromJson(json["user"]),
        // created = DateFormat("yyymm-mm-dd").parse(json["created"]),
        // updated = DateFormat("yyymm-mm-dd").parse(json["updated"]);
        created = DateTime.parse(json["created"]),
        updated = DateTime.parse(json["updated"]);
}