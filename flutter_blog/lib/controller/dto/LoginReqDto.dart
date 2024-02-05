
class LoginReqDto {
  final String? username;
  final String? password;

  LoginReqDto(this.username,  this.password); // 생성자

  Map<String, dynamic> toJson() => {
    "username":username,
    "password":password,
  };
}