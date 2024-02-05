import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:get/get.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //PostController p = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form( // Form : 유효성 검사, Form안의 값을 서버에 넘겨줌.
          key: _formKey,
          child: ListView( // ListView : 스크롤 지원
            children: [
              CustomTextFormField( // 공통 : 제목 영역
                controller: _title,
                hint: "Title",
                funValidator: validateTitle(),
              ),
              CustomTextArea( // 공통 : 내용 영역
                controller: _content,
                hint: "Content",
                funValidator: validateContent(),
              ),
              CustomElevatedButton( // 공통 : 버튼 영역
                text: "글쓰기",
                funPageRoute: () async{
                  if(_formKey.currentState!.validate()) {
                    // 뭔가 함수 호출
                    await Get.find<PostController>().save(_title.text, _content.text); // 1건만 여기서 호출할 경우. 3초 (로딩 그림)
                    Get.off(() => HomePage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
