import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 키보드 입력값 확인

  @override
  Widget build(BuildContext context) {
    return Form(
      // 여러개의 데이타를 한번에 보낼 수 있음, 유효성 검사도 가능.
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "Email",
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            text: "Password",
          ),
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              // 유효성 검사 성공 true 리턴, 아니면 false 리턴
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home");
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
