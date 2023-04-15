import 'package:f_lecture/ch6/widgets/ch6_widgets.dart';
import 'package:flutter/material.dart';

class UiExam1Review extends StatefulWidget {
  const UiExam1Review({Key? key}) : super(key: key);

  @override
  State<UiExam1Review> createState() => _UiExam1ReviewState();
}

class _UiExam1ReviewState extends State<UiExam1Review> {

  final Ch6Widgets ch6widgets = Ch6Widgets();

  // viewport 화면에 보이는 영역
  //
  final PageController pageController = PageController(viewportFraction: 0.9);

  List<String> imageList = [
    "assets/winter.jpg",
    "assets/winter.jpg",
    "assets/winter.jpg",
    "assets/winter.jpg",
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ch6widgets.appBar(),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ch6widgets.body(pageController, imageList),
          const Center(child: Text("이용서비스"),),
          const Center(child: Text("내정보"),),
        ],
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        debugPrint(value.toString());
      },
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
      iconSize: 26,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          activeIcon: Icon(Icons.assignment),
          label: "이용서비스",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
          label: "내 정보",
        ),
      ],
    );
  }
}
