import 'package:f_lecture/ch3/widgets/container_widget.dart';
import 'package:flutter/material.dart';

/// 단축키 stl
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: ContainerWidget(),
    );
  }
}
