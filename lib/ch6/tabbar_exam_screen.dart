import 'package:flutter/material.dart';

class TabBarExamScreen extends StatefulWidget {
  const TabBarExamScreen({Key? key}) : super(key: key);

  @override
  State<TabBarExamScreen> createState() => _TabBarExamScreenState();
}

class _TabBarExamScreenState extends State<TabBarExamScreen>
    with SingleTickerProviderStateMixin {
  // TabBar와 IndexedStack 위젯을
  // 사용해서 페이지를 전환해보세요
  // TabBar는 3개
  // IndexedStack의 children도 3개
  // 탭바의 모양, 텍스트 자유
  // IndexedStack의 위젯들도 자유

  late TabController tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBarExamScreen"),
      ),
      body: Column(
        children: [
          _tabBar(),
          // IndexedStack 자체도 사이즈를 설정해주지 않으면
          // height를 알수 없음
          // 그래서 Expanded 를 입력해서 화면 꽉채우라고 명령
          // Expanded(child: _indexedStack()),
          SizedBox(
            height: 200,
            child: _indexedStack(),
          )
        ],
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      tabs: const [
        Tab(text: '탭 1'),
        Tab(text: '탭 2'),
        Tab(text: '탭 3'),
      ],
    );
  }

  Widget _indexedStack() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.green),
      ],
    );
  }
}
