import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://192.168.101.69:8080";

// 1. 통신
class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization" : jwtToken ?? ""} ); // header에 jwtToken 붙여서 처리해야함, null이면 공백 던짐.

  Future<Response> findById(int id) =>
      get( "$host/post/$id", headers: {"Authorization" : jwtToken ?? ""} );

  Future<Response> deleteById(int id) =>
      delete( "$host/post/$id", headers: {"Authorization" : jwtToken ?? ""} );

  Future<Response> updateById(int id, Map data) =>
      put( "$host/post/$id", data, headers: {"Authorization" : jwtToken ?? ""} );

  Future<Response> save(Map data) =>
      post( "$host/post", data, headers: {"Authorization" : jwtToken ?? ""} );

}
