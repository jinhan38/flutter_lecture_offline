import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SingleScrollScreen extends StatefulWidget {
  const SingleScrollScreen({Key? key}) : super(key: key);

  @override
  State<SingleScrollScreen> createState() => _SingleScrollScreenState();
}

class _SingleScrollScreenState extends State<SingleScrollScreen> {
  /// initState() 최초 한번만 호출됨
  /// build 함수는 setState 하면 다시 호출됨.
  ///
  /// 개발 하면서 저장하거나 번개모양(hotReload) 해도 build 호출
  /// 유저 입장에서는 build를 타기 위해서는 최초 생성되거나
  /// setState 함수를 호출해야 함

  /// ScrollController 말 그대로 스크롤이 있는 위젯을 컨트롤 할 수 있다.
  /// 스크롤에 대한 정보를 가지고 있음
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 500);

  /// 변경된 스크롤 offset의 값을 담는 변수
  double offset = 0;

  /// 위젯이 생성될 때 한번만 호출됨
  /// 화면 자체를 다시 생성해야 코드가 반영됨
  @override
  void initState() {
    scrollController.addListener(() {
      /// 시작점부터 얼마나 스크롤을 했는지, 스크롤 된 거리
      // print('${scrollController.offset}, ${scrollController.position.maxScrollExtent}');

      /// 스크롤이 변경 됐을 때
      /// setState 함수를 호출해서 화면을 다시 그리도록 함.
      /// setState 함수는 stateful위젯에서만 존재
      // setState(() {
      offset = scrollController.offset;
      // });

      /// 스크롤의 최대값
      // scrollController.position.maxScrollExtent

      /// 스크롤의 방향 정보
      // print('${scrollController.position.userScrollDirection}');
      ScrollDirection direction = scrollController.position.userScrollDirection;

      switch (direction) {
        case ScrollDirection.idle:
          break;
        case ScrollDirection.forward:
          print('스크롤 forward : ${DateTime.now()}');
          break;
        case ScrollDirection.reverse:
          print('스크롤 reverse : ${DateTime.now()}');
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// ScrollController가 스크롤 위젯에 연결 됐는지 확인
    /// 최초 build에 진입 했을 때

    /// 최초 생성시에는 scrollController.hasClients = false로 출력
    /// SingleChildScrollView 위젯은 아직 생성 안한 상태기 때문
    /// 그러나 build를 다시 타게될 경우에는 scrollController.hasClients = true
    print('scrollController.hasClients : ${scrollController.hasClients}');

    return Scaffold(
      appBar: AppBar(
        title: Text("SingleScrollScreen"),
      ),
      body: SingleChildScrollView(
        controller: scrollController,

        /// 스크롤 상하좌우에 들어가는 패딩
        padding: const EdgeInsets.all(30),

        /// 아이폰에서만 적용 가능
        /// IOS에서 상태바를 눌렀을 때 스크롤이 최상단으로 이동
        /// ScrollController는 같이 사용 불가
        // primary: true,

        /// reverse
        /// true : 바닥부터 시작
        /// false : 처음부터 시작
        reverse: false,

        scrollDirection: Axis.vertical,

        /// ScrollViewKeyboardDismissBehavior.onDrag
        /// -> 스크롤을 하면 키보드가 내려옴
        /// ScrollViewKeyboardDismissBehavior.manual
        /// -> 스크롤을 해도 키보드가 그대로 떠있음
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(),
            ),

            Text(offset.toString()),

            /// 코드로 스크롤 이동
            ElevatedButton(
              onPressed: () {
                scrollController.jumpTo(1000);
              },
              child: Text("jumpTo"),
            ),

            ElevatedButton(
              onPressed: () {
                /// milliseconds 1000 = 1초(second)
                scrollController.animateTo(
                  2000,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                );
              },
              child: Text("animateTo"),
            ),

            /// ... 기호
            /// 리스트로 된 변수들을 반환하게 해줌
            ...listItem(),
          ],
        ),
      ),
    );
  }

  List<Widget> listItem() {
    List<Widget> widgets = [];

    /// int i의 시작 값은 0
    /// 한번 반복될 때 마다 1씩 증가(++)
    /// i가 10 미만일 때 까지만 반복
    for (int i = 0; i < 10; i++) {
      widgets.add(item());
    }
    return widgets;
  }

  Widget item() {
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

      /// padding은 위젯 내부 간격
      /// margin은 위젯 외부 간격
      margin: const EdgeInsets.all(5),
    );
  }
}
