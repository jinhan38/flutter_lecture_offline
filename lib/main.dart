import 'package:flutter/material.dart';

import 'ch4/scaffold_widget.dart';
import 'home_screen.dart';

/// main 함수, 앱을 실행하면 가장 먼저 실행되는 함수
void main() {
  /// runApp 앱을 실행 시키기 위해서 호출하는 함수
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScaffoldWidget(),
    );
  }
}
