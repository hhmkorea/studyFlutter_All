import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // 상태관리 : UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final users = <User>[].obs; // obs가 상태관리함.
  final user = User().obs;

  void logout(){ // 로그아웃
    this.isLogin.value = false;
    this.user.value.isBlank;
    jwtToken = null;
    // Get.Storage() // 로그인한 상태값 담아둠. 토큰이 유효한 범위까지. 1시간.
  }

  Future<int> login(String username, String password) async {
    // await사용할 경우 Future<>와 async가 붙어야함.
    User principal = await _userRepository.login(username, password); // 기다렸다가 데이터 받아야함. 처음에 null을 기본으로 받게됨.

    if(principal.id != null) {
      this.isLogin.value = true;
      this.user.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<void> save(String username, String password, String email) async{
    User user = await _userRepository.save(username, password, email);
    if(user.username != null) {
      this.users.add(user);
    }
  }

}