import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final int? id; // 게시물 번호

  const DetailPage(this.id); // 생성자로 id 받음

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments; // argument 받는 테스트
    UserController u = Get.find();
    PostController p = Get.find();

    print("로그인 유저아이디 : ${u.user.value.id}");

    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 아이디 : $id, 로그인 상태 : ${u.isLogin}"), // 1개일 경우 {}로 감싸지 않아도 됨.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 배치
            children: [
              Text(
                "${p.post.value.title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Divider(),
              u.user.value.id == p.post.value.user!.id
                  ? Row(
                      // 삭제, 수정 버튼 가로 영역으로 보여줌
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            await p.deleteById(p.post.value.id!);
                            Get.off(() => HomePage()); // HomePage() : 리스트로 갱신되어 이동됨, 상태관리로 갱신시킬 수 있음.
                            // Get.back(); // 뒤로가면 상태 변경이 되므로 이걸로 해도 됨.
                          },
                          child: Text("삭제"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Get.to(() => UpdatePage()); // UpdatePage() : 수정 화면으로 이동
                          },
                          child: Text("수정"),
                        ),
                      ],
                    )
                  : SizedBox(),
              Expanded(
                // Expanded : 글제목 제외한 나머지 부분 영역을 차지함.
                child: SingleChildScrollView(
                  // 높이가 없으므로 Expanded 붙여야 함.
                  child: Text("${p.post.value.content}"), // 글 내용 보여줌.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
