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
      ),
      body: Center(),
    );
  }
}
