import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/JoinReqDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공! => json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password); // loginReqDto : dart request object
    print(loginReqDto.toJson()); // 로그인한 유저 id, pwd 응답 결과값 로그로 뿌려줌.
    Response response = await _userProvider.login(loginReqDto.toJson());
    // data를 Map 타입으로 await로 기다림.
    // async를 반드시 지정해야함.
    // user_provider에서 Future를 통해 null 먼저 던져주니 await로 기다려!!라고 지정하고 응답결과 가져온거 뿌림.

    dynamic headers = response.headers; // --->>> 통신의 header 값
    dynamic body = response.body;
    //print("사용자 정보 : $body");

    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) { // 통신 성공하면 token은 무조건 있음
      User principal = User.fromJson(cmRespDto.data);

      String token = headers["authorization"];

      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      return User();
    }

    /*if(headers["authorization"] == null) { // 응답을 안하면 null 값
      return "-1"; // null을 리턴 못해서 -1로
    } else {
       String token = headers["authorization"]; // Bearer Token 가져오기!!
      return token;
    }*/
  }

  Future<User> save(String username, String password, String email) async {
    JoinReqDto joinReqDto = JoinReqDto(username, password, email);
    print("username ---------------------------" + joinReqDto.username.toString());
    print("password---------------------------" + joinReqDto.password.toString());
    print("email---------------------------" + joinReqDto.email.toString());
    Response response = await _userProvider.save(joinReqDto.toJson());

    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print("회원가입 성공");
      User user = User.fromJson(cmRespDto.data); // 등록한 내용 가져옴.
      return user;
    } else {
      print("회원가입 실패");
      return User();
    }
  }

}