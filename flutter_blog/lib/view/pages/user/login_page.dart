import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController()); // 상태관리 ------>>> 로그인 하면서 jwt token 파일 받아둠.
  final _username = TextEditingController(); // ?를 넣으면 null 도 받을 수 있는 타입
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView( // 키보드 스크롤 뷰 가능하게 ListView로 만듬.
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지 ${u.isLogin}",
                style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() { // 최상위 Widget 클래스로 지정해야 오류가 덜남.
    return Form( // validation 체크할때 넣어서 하는게 좋음.
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {                      // funPageRoute 페이지 이동 라우터
              if(_formKey.currentState!.validate()) {     // _formKey 현재 상태는 절대 null이 아님.
                //u.login("ssar", "1234");                // --->>> 데스트용 로그인 데이타!!!
                int result  = await u.login(_username.text.trim(), _password.text.trim()); // --->>> 로그인에서 jwt token 받음!! await 기다림!!
                if(result == 1) {
                  Get.to(() => HomePage());               // --->>> 추천하는 문법으로, 메모리 부하를 줄여줌.
                } else {
                  Get.snackbar("로그인 시도", "로그인 실패"); // 화면 상단에 안내 팝업 띄움.
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(() => JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
