
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

// 3. 호출
class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs; // obs가 상태관리함.
  final post = Post().obs;

  @override
  void onInit() { // 자동완성 안됨... alt+insert > override method > onInit() 선택
    super.onInit();
    findAll();
  }

  Future<void> save(String title, String content) async{
    Post post = await _postRepository.save(title, content);
    if(post.id != null) {
      this.posts.add(post);
    }
  }

  Future<void> updateById(int id, String title, String content) async {
    Post post = await _postRepository.updateById(id, title, content); // 변경된 데이터 가져옴.

    if(post.id != null) {
      this.post.value = post; // DetailPage() 상세 화면 정보 갱신됨.
      this.posts.value = this.posts.map((e) => e.id == id ? post : e).toList();
      // 뒤로 보기 버튼 눌렀을때 Homepage() 리스트 게시물 제목 변경됨.
      // posts에 map을 돌면서 돌려받은값 덮어씌우기
      // // 원하는 값만 변경할때 정규 연산자 쓰면 됨, 3장 17강 스프레드 연산자 참고.
    }

  }

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);

    if(result == 1) {
      print("서버 쪽 삭제 성공!!!");
      List<Post> result = posts.value.where((post) => post.id != id).toList(); // 3장 15강 반복문
      //print(result.length);
      posts.value = result;

    }
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts; // 통신 끝나면 값이 담김.
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id!);
    this.post.value = post;
  }
}