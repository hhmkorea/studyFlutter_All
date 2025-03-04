import 'package:get/get.dart';

const host = "http://192.168.100.37:8080";

// 통신
class UserProvider extends GetConnect {
// Promise (데이터 약속)
// Future<Response> 미래 데이타를 약속한다는 의미,
// 데이타가 없으면 호출 즉시 null 던져줌, 데이터 통신 완료되면 응답된 데이터 채워줌!!

  Future<Response> login(Map data) => post("$host/login", data);

  Future<Response> save(Map data) => post("$host/join", data);
}
