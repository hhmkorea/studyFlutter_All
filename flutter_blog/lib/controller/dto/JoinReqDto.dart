
class JoinReqDto {
  final String? username;
  final String? password;
  final String? email;

  JoinReqDto(this.username,  this.password, this.email); // 생성자

  Map<String, dynamic> toJson() => {
    "username":username,
    "password":password,
    "email":email,
  };
}
