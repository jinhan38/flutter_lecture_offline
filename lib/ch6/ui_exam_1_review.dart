import 'package:flutter/material.dart';

class UiExam1Review extends StatefulWidget {
  const UiExam1Review({Key? key}) : super(key: key);

  @override
  State<UiExam1Review> createState() => _UiExam1ReviewState();
}

class _UiExam1ReviewState extends State<UiExam1Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("복잡한 UI"),
        // 왼쪽에 넣는 위젯
        // leading: ,

        // back 버튼 자동 생성 여부
        // automaticallyImplyLeading: false,

        actions: [
          // Button 종류들은 기본적으로 간격이 들어가 있음
          IconButton(
            onPressed: () {
              debugPrint("+ 버튼 클릭");
            },
            icon: const Icon(Icons.add),
          ),

          /// GestureDetector는 기본적으로
          /// child의 영역만 클릭
          /// 효과가 없음
          GestureDetector(
            onTap: () {
              debugPrint("- 버튼 클릭 : ${DateTime.now()}");
            },
            child: const Icon(
              Icons.remove,
              size: 30,
            ),
          ),

          /// 물결처럼 퍼지는 효과가 있음
          /// splash, ripple
          InkWell(
            onTap: () {},
            splashColor: Colors.red,
            customBorder: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.add_a_photo),
            ),
          )
        ],
      ),
    );
  }
}
