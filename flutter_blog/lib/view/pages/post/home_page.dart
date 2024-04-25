import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/view/pages/post/detail_page.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var scaffodkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // 여기에 async ~ await 넣으면 화면이 멈춤!! 쓰지 않음.
    UserController u = Get.find();
    // find : 있는거 찾기!!
    // put : 없으면 만들고, 있으면 찾기!!,

    /* 객체생성(create), onInit()함수 실행(initialize) */
    PostController p = Get.put(PostController()); // put : 개체 하나씩만 만듬.
    // Get.create(() => null) // controller별 객체를 생성해서 만들경우 사용.

    //p.findAll(); // --->>> PostController 호출시 onInit()에서 호출되도록 넣음.

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // <> 버튼으로 네이게이션 제어
        onPressed: () {
          if (scaffodkey.currentState!.isDrawerOpen) {
            scaffodkey.currentState!.openEndDrawer();
          } else {
            scaffodkey.currentState!.openDrawer();
          }
        },
        child: Icon(Icons.code),
      ),
      drawer: _navigation(context), // 왼쪽 메뉴 draw로 넣음
      appBar: AppBar(
        title: Text("${u.isLogin}"), // --->> 상태관리, appbar에 로그인 잘되면 true로 보여줌.
        /*
        1. user_controller.dart : final RxBool isLogin = false.obs;
        2. title: Obx(() => Text("${u.isLogin}")), ---> 이래야 관찰 가능한 변수가 됨.
           앱바에 로그인되면 true 출력함.
           Obx() : 컨트롤러 상태가 변경이 되면 자동으로 업데이트 됨.
        */
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => RefreshIndicator(
          // 서버 재시작 후 갱신된 데이터 마우스 스크롤 하면 갱신되어 보임.
          key: refreshKey,
          onRefresh: () async {
            await p.findAll();
          },
          child: ListView.separated(
            // 분리선 있는 리스트 ---> Obx가 상태관리함!!!
            itemCount: p.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  // --->>> 리스트 제목 클릭할때!!!
                  await p.findById(p.posts[index].id!); // 변수 옆에! 붙여서 null이 절대 아닌걸 지정함, async~ await로 기다렸다가 받게 해야함. 아니면 에러 페이지 보임.
                  Get.to(() => DetailPage(p.posts[index].id), arguments: "arguments 속성 테스트"); // 클릭하면 기다렸다가 상세 페이지로
                },
                title: Text("${p.posts[index].title}"),
                leading: Text("${p.posts[index].id}"),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    // 왼쪽 메뉴 부분
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context), // 뒤로가기 버튼 대신 드로우 메뉴 넣음.
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => WritePage()); // 글쓰기
                },
                child: Text("글쓰기", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54)),
              ),
              Divider(), // 분리선 넣음
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // --->>> stack으로 제일 위에 쌓인 화면 날림.
                  //scaffodkey.currentState!.openEndDrawer(); // 이렇게 해도 되는데 에러남.
                  Get.to(() => UserInfo()); // 회원정보 보기
                },
                child: Text(
                  "회원정보보기",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  u.logout(); // --->>> 로그아웃 처리
                  Get.to(() => LoginPage()); // 로그인 화면으로 이동
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
