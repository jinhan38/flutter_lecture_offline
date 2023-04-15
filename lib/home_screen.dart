import 'package:f_lecture/ch3/widgets/container_widget.dart';
import 'package:f_lecture/ch3/widgets/row_widget.dart';
import 'package:f_lecture/ch4/scaffold_widget.dart';
import 'package:f_lecture/ch4/text_form_field_screen.dart';
import 'package:f_lecture/ch5/gridview_screen.dart';
import 'package:f_lecture/ch5/listview_screen.dart';
import 'package:f_lecture/ch5/pageview_screen.dart';
import 'package:f_lecture/ch5/ui_exam_1.dart';
import 'package:f_lecture/ch6/ui_exam_1_review.dart';
import 'package:flutter/material.dart';

import 'ch3/widgets/column_row_widget.dart';
import 'ch3/widgets/column_widget.dart';
import 'ch3/widgets/text_widget.dart';
import 'ch4/button_screen.dart';
import 'ch5/image_screen.dart';
import 'ch5/single_scroll_screen.dart';
import 'ch6/bottom_navigation_bar_screen.dart';

/// 단축키 stl
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            button(
              context: context,
              text: "Scaffold, Appbar",
              page: const ScaffoldWidget(),
            ),
            button(
              context: context,
              text: "TextFormField",
              page: const TextFormFieldScreen(),
            ),
            button(
              context: context,
              text: "ButtonScreen",
              page: const ButtonScreen(),
            ),
            button(
              context: context,
              text: "ImageScreen",
              page: const ImageScreen(),
            ),
            button(
              context: context,
              text: "SingleScrollScreen",
              page: const SingleScrollScreen(),
            ),
            button(
              context: context,
              text: "ListViewScreen",
              page: const ListViewScreen(),
            ),
            button(
              context: context,
              text: "GridViewScreen",
              page: const GridViewScreen(),
            ),
            button(
              context: context,
              text: "PageViewScreen",
              page: const PageViewScreen(),
            ),
            button(
              context: context,
              text: "UiExam1",
              page: const UiExam1(),
            ),
            button(
              context: context,
              text: "UiExam1Review",
              page: const UiExam1Review(),
            ),
            button(
              context: context,
              text: "BottomNavigationBarScreen",
              page: const BottomNavigationBarScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget button({
    required BuildContext context,
    required String text,
    required Widget page, // 이동하려는 화면
  }) {
    return Container(
      // double.infinity -> 최대 값 사용
      width: double.infinity,
      height: 70,

      // 패딩을 준다. top(위쪽)만 20.
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          print('HomeScreen.button');

          // 화면이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ),
          );
        },
        child: Text(text),
      ),
    );
  }
}
