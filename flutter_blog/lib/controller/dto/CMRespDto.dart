
class CMRespDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({
    this.code,
    this.msg,
    this.data,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트, list 또는 한건의 데이타 받을때 활용
  CMRespDto.fromJson(Map<String, dynamic> json)
      : code = json["code"], // 이니셜 라이즈드 연산자
        msg = json["msg"],
        data = json["data"];
}
