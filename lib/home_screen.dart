import 'package:f_lecture/ch3/widgets/container_widget.dart';
import 'package:f_lecture/ch3/widgets/row_widget.dart';
import 'package:flutter/material.dart';

import 'ch3/widgets/column_row_widget.dart';
import 'ch3/widgets/column_widget.dart';
import 'ch3/widgets/text_widget.dart';

/// 단축키 stl
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: ColumnRowWidget(),
    );
  }
}
