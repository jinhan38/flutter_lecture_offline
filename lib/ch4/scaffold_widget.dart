import 'package:flutter/material.dart';

/// stl -> tab
/// Scaffold : Flutter MaterialApp에서 최상위 레벨로 고안된 위젯
/// 상위 레벨 -> 대체적으로 상위 레벨은 위젯이던/클래스던 위쪽에서 먼저 사용하는 것
/// 하위 레벨 -> 나중에 사용하는 것
/// Scaffold 위젯을 언제 사용하는가? -> 대체적으로 페이지 단위로 사용
/// page/screen -> 화면 전체를 의미하기도 하고, 화면 이동의 단위
class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 상위 레벨 Scaffold
    /// 하위 레벨 Center(body에 들어오는 위젯)
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold Widget"),
        primary: false,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            ),
          ],
        ),
      ),

      /// true로 설정하면 키보드가 올라왔을 때 화면 사이즈 조정
      /// false로 설정하면 키보드가 올라와도 화면 사이즈 조정 안 함
      resizeToAvoidBottomInset: true,

      /// 앱바와 같이 사용되는 특성
      /// 상태바의 영역을 사용할지 설정
      /// 상태바(statusBar) : 디바이스 상단에 시간, 배터리, 네트워크 정보 나오는 위치
      primary: false,
      extendBodyBehindAppBar: true,

      /// 상태바를 제거해야 되는 경우가 있다.
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.blue,
        ),
        // Container(
        //   width: 100,
        //   height: 50,
        //   color: Colors.blue,
        // ),
        // Container(
        //   width: 100,
        //   height: 100,
        //   color: Colors.yellow,
        // ),
        // Container(
        //   width: 100,
        //   height: 100,
        //   color: Colors.white,
        // ),
      ],
    );
  }
}
