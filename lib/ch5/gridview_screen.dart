import 'dart:math';

import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridViewScreen"),
      ),

      /// Column 안에 스크롤이 있는 위젯이 들어가면 오류 발생
      /// 'Vertical viewport was given unbounded height.'
      /// 문제는 오류 그대로 높이 설정을 안 해줘서 발생
      /// Expanded는 Column 내부에서 최대로 확장한 사이즈로 그려짐
      body: Column(
        children: [
          /// 스크롤 이동 버튼
          ElevatedButton(
            onPressed: () {
              if (scrollController.hasClients) {
                scrollController.animateTo(500,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              }
            },
            child: const Text("500으로 이동"),
          ),

          // SizedBox(
          //   height: 400,
          //   child: gridviewBuilder(),
          // ),
          Expanded(child: gridviewBuilder()),

          ElevatedButton(
            onPressed: () {
              if (scrollController.hasClients) {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              }
            },
            child: const Text("0으로 이동"),
          ),
        ],
      ),
    );
  }

  Widget gridviewCount() {
    /// crossAxisCount
    /// -> 기준축과 교차되는 축에 들어가는 아이템 개수
    /// crossAxisSpacing
    /// -> 기준축과 교차되는 축의 아이템 사이 간격
    /// mainAxisSpacing
    /// -> 기준축 아이템들의 간격
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 40,
      children: [
        ...listItem(),
      ],
    );
  }

  Widget gridviewBase() {
    return GridView(
      gridDelegate: delegate(),
      children: [
        ...listItem(),
      ],
    );
  }

  Widget gridviewBuilder() {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: delegate(),
      itemCount: 100,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 99) {
              scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            }
          },
          child: Column(
            children: [
              Text(
                index.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(child: item()),
            ],
          ),
        );
      },
    );
  }

  SliverGridDelegate delegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,

      /// 기준축과 교차축의 아이템 사이즈 비율
      /// 1 : 기준축, 교차축 동일
      /// 0.5 : 기준축이 교차축의 2배
      /// 2 : 교차축이 기준축의 2배
      /// 기기별 사이즈 다양한.
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,

      /// 메인축의 사이즈 설정
      mainAxisExtent: 110,
    );
  }

  List<Widget> listItem() {
    List<Widget> widgets = [];

    /// int i의 시작 값은 0
    /// 한번 반복될 때 마다 1씩 증가(++)
    /// i가 10 미만일 때 까지만 반복
    for (int i = 0; i < 50; i++) {
      widgets.add(item());
    }
    return widgets;
  }

  Widget item() {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    );
  }
}
