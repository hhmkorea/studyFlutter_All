import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _buildTabBar(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 35,
            child: _buldListView(),
          ),
        ),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() { // 과제1 : TabBarView와 TabBar를 사용
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          text: "갤러리",
        ),
        Tab(
          text: "타임라인",
        ),
      ],
      indicatorColor: Colors.deepPurpleAccent,
      indicatorWeight: 3.5,
      labelColor: Colors.deepPurpleAccent,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
  }

  Widget _buildTabBarView() { // 과제1 : TabBarView와 TabBar를 사용
    return TabBarView(
      controller: _tabController,
      children: [ // 과제3 : Grid와 ListView 활용
        _buildGridView(), // 갤러리
        _buildTimeLine(), // 타임라인
      ],
    );
  }

  ListView _buildTimeLine() {
    return ListView(
      children: [
        // 18
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "18",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "일요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "파이널 프로젝트 마무리!",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // 19
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "19",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "월요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "하브루타 노트 작성하기",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 20
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "20",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "화요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "블로그 정리하기",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 21
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "21",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "수요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "플러터 라이브러리 공부 및 블로그 정리",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 22
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "22",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "목요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "PPT 제작",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 23
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "23",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "금요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "TODOFRIENDS 앱 영상 촬영하기",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 24
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "24",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: const Center(
                        child: Text(
                          "토요일",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffeeeeee),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(
                          "팀원들이랑 일정 공유하기",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListView _buldListView() {
    return ListView(
      children: const [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left:130),
              child: Center(
                child: Text(
                  "2022년 12월",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(FontAwesomeIcons.chevronDown, color: Colors.grey, size: 17),
          ],
        ),
      ],
    );
  }

  Container _buildGridView() {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 30, right: 30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 3,
          crossAxisCount: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: 42,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(7), // 테두리 둥글게
            child: Image.network(
                "https://picsum.photos/id/${index + 10}/200/200"),
          );
        },
      ),
    );
  }

}
