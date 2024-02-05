import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 폼 상태 관리하는 글로벌 키
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 상하좌우 여백 주기
        child: ListView( // 키보드 스크롤 뷰 가능하게 ListView로 만듬.
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "회원가입 페이지",
                style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm(), // 유효성 검사할 값을 Form에 모아둠.
          ],
        ),
      ),
    );
  }

  Widget _joinForm() { // 최상위 Widget 클래스로 지정해야 오류가 덜남.
    final UserController u = Get.find();
    _username.text = "";
    _password.text = "";
    _email.text = "";

    return Form( // Form : spring server에 validation 체크할 값을 한꺼번에 넣기에 좋음.
      key: _formKey, // _formKey : 폼 내부를 어디서든 관리할 수 있는 키.
      child: Column(
        children: [
          CustomTextFormField( // 공통 : 텍스트 입력란
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(), // 공통 : 유효성 검사
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            controller: _email,
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomElevatedButton( // 공통 : 버튼 스타일
            text: "회원가입",
            funPageRoute: () async{  // funPageRoute 페이지 이동 라우터
              if(_formKey.currentState!.validate()) { // 유효성 검사 다 끝나면 페이지 이동
                print("_username.text:" + _username.text);
                print("_password.text:" + _password.text);
                print("_email.text:" + _email.text);

                await Get.find<UserController>().save(_username.text, _password.text, _email.text); // 1건만 여기서 호출할 경우. 3초 (로딩 그림)
                Get.off(() => LoginPage());
              }
          },
        ),
        TextButton(
          onPressed: () {
            Get.to(() => LoginPage()); // Get.to를 이용해서 로그인 페이지로 이동.
          },
          child: Text("로그인 페이지로 이동"),
        ),
      ],
    ),
  );
  }
}
