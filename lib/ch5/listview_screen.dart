import 'dart:math';

import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  String imageUrl =
      "https://media.cnn.com/api/v1/images/stellar/prod/210316134738-02-wisdom-project-summer.jpg?q=w_3568,h_2006,x_0,y_0,c_fill";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListViewScreen"),
      ),
      body: listviewSeperated(),
    );
  }

  /// ListView의 자식 뷰들은
  /// Height값이 없으면 오류 발생
  /// 오류 발생하는 이유는 높이 값이 설정이 안돼서
  /// 스크롤이 무한으로 설정됨
  Widget listview() {
    return ListView(
      /// physics : 스크롤 방식 설정
      /// 스크롤뷰(A) 안에 다른 스크롤뷰(B)가 들어갈 수 있다.
      /// A 안에 B가 들어가는 경우가 있을 수 있다.
      /// B의 physics 설정해서 스크롤을 못하게 설정
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.green,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.red,
            ),
            Image.network(imageUrl),
          ],
        )

        // ...listItem(),
      ],
    );
  }

  Widget listviewBuilder() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        // index : 순서/번호
        // 시작은 0번부터, 마지막 index 9
        // ex) index : 4인 경우
        // ex) 마지막 index에 도달했을 때, 데이터 호출
        return Column(
          children: [
            Text(
              index.toString(),
              style: const TextStyle(fontSize: 25),
            ),
            if (index == 4) ...[
              Image.network(imageUrl),
            ],
            item(),
            if (index == 9) ...[
              const CircularProgressIndicator(),
            ],
          ],
        );
      },
    );
  }

  List<int> intList = [5, 2, 4, 678, 15, 4, 2, 5, 7, 43];

  Widget listviewSeperated() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return item();
      },
      separatorBuilder: (context, index) {
        // 구분선 , 아이템들의 사이에 들어오는 값
        // 최대 index 값이 builder 들어오는 index보다 무조건 1 적다.
        print('index : $index');
        return const Divider(
          height: 20,
          thickness: 5,
          color: Colors.red,
        );
      },
      itemCount: intList.length,
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
