import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  // late 키워드는 변수를 나중에 생성하겠다.
  // 생성을 안해주고 사용하면 오류 발생
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 8,
      vsync: this,
      animationDuration: const Duration(milliseconds: 500),
      initialIndex: 2,
    );
    tabController.addListener(() {
      print('listene : ${tabController.index}');
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarScreen'),
      ),
      body: Column(
        children: [
          _tabBar(),
          ElevatedButton(
            onPressed: () {
              // 특정 탭으로 이동
              tabController.index = 6;
            },
            child: Text("이동"),
          ),
          ElevatedButton(
            onPressed: () {
              tabController.animateTo(
                3,
                duration: const Duration(milliseconds: 800),
              );
            },
            child: Text("이동 애니메이션"),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      onTap: (value) {
        debugPrint("value : $value");
      },
      controller: tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
      overlayColor: MaterialStateProperty.all(
        Colors.blue.shade100,
        // 클릭 이펙트 없게 하기 위해 설정
        // Colors.transparent,
      ),

      splashBorderRadius: BorderRadius.circular(10),

      // 인디캐이터 컬러
      indicatorColor: Colors.black,

      // 인디캐이터의 height 값
      indicatorWeight: 5,

      // TabBarIndicatorSize.label = 글자 width만큼
      // TabBarIndicatorSize.tab = tab width만큼
      indicatorSize: TabBarIndicatorSize.tab,

      // 인디캐이터의 패딩
      // indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),

      indicator: BoxDecoration(
        color: Colors.green,
        // shape: BoxShape.circle,
        // shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.orange,
          width: 5,
        ),
      ),

      // isScrollable입력 안하거나 false로 했을 때 -> 화면 가로 사이즈에 맞춤
      // isScrollable true일 때는 스크롤 가능
      isScrollable: true,

      // 탭바의 상하좌우에 적용하는 패딩
      padding: const EdgeInsets.symmetric(horizontal: 20),

      labelPadding: const EdgeInsets.symmetric(horizontal: 10),

      tabs: const [
        Tab(text: "바지"),
        Tab(text: "상의"),
        Tab(text: "자동차"),
        Tab(text: "가방"),
        Tab(text: "바지"),
        Tab(text: "상의"),
        Tab(text: "자동차"),
        Tab(text: "가방"),
      ],
    );
  }
}
