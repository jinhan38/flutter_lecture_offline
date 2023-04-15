import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomNavigationBarScreen"),
      ),
      //
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(color: Colors.white),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: _bottom(),
    );
  }

  /// BottomNavigationBar item은 3개 이상 필요
  Widget _bottom() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        // setState는 화면을 다시 그리라는 명령
        setState(() {
          _currentIndex = value;
        });

        debugPrint(value.toString());
      },

      showSelectedLabels: true,
      showUnselectedLabels: false,

      iconSize: 30,

      // elevation: 50,

      selectedLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),

      /// selectedItemColor 텍스트랑 아이콘 둘다 변경
      selectedItemColor: Colors.purple,

      unselectedItemColor: Colors.grey,

      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white,

      items: const [
        BottomNavigationBarItem(
          // 선택 안 됐을 때
          icon: Icon(Icons.home_outlined),

          // 선택 됐을 때
          activeIcon: Icon(Icons.home),

          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_off),
          activeIcon: Icon(Icons.access_alarm),
          label: "알림",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "친구",
        ),
      ],
    );
  }
}
