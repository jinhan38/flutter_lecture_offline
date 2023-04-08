import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController pageController = PageController();

  /// initState는 최초 한번만 실행
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {});

      /// 페이지뷰를 움직일 때 마다 진입

      /// PageView의 offset
      // print('${pageController.offset}');

      /// PageView의 현재 페이지
      /// 페이지뷰가 스크롤뷰와 다른 것은 페이지의 구분
      // print('${pageController.page}');

      /// 최대 offset
      // print('max : ${pageController.position.maxScrollExtent}');

      /// 최소  offset
      // print('min : ${pageController.position.minScrollExtent}');

      /// 끝에 도달했는지 체크
      /// 끝이라는 것은 0번째(첫번째) 페이지, 마지막 페이지
      // print('${pageController.position.atEdge}');

      /// 스크롤의 방향
      // print(
      //     '${pageController.position.userScrollDirection} : ${DateTime.now()}');

      // pageController.hasClients;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// 버튼을 클릭해서 페이지를 이동시켜주세요
  /// pageController를 사용하시면 됩니다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageViewScreen"),
      ),
      body: Column(
        children: [
          /// 페이지랑 offset정보
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// pageController.hasClients를 호출
              /// -> 컨트롤러가 PageView에 붙었는지 체크
              /// pageController.page.toStringAxFixed(2)
              if (pageController.hasClients) ...[
                /// 변수 타입에 ?가 붙으면 nullable-type
                /// nullable-type을 호출 할 때 ? 키워드를 붙여서 사용 가능
                Text(
                  "page : ${pageController.page?.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 25),
                ),
                Text("offset : ${pageController.offset.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 25))
              ] else ...[
                const Text("page : 0"),
                const Text("offset : 0")
              ],
            ],
          ),

          /// 버튼
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  /// offset 값을 사용해서 이동하려면
                  /// pageSnapping: false 선언
                  pageController.jumpTo(450);
                },
                child: const Text("jumpTo"),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                },
                child: const Text("jumpToPage"),
              ),
            ],
          ),

          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  pageController.animateTo(
                    100,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: const Text("animateTo"),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: const Text("animateToPage"),
              ),
            ],
          ),

          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: const Text("previousPage"),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: const Text("nextPage"),
              ),
            ],
          ),

          /// 페이지뷰
          Expanded(child: pageViewWidget()),
        ],
      ),
    );
  }

  Widget pageViewWidget() {
    return PageView(
      controller: pageController,

      // reverse: true,

      // scrollDirection: Axis.vertical,

      pageSnapping: false,

      onPageChanged: (value) {
        print('value : $value');
      },

      children: [
        Container(color: Colors.green),
        Container(color: Colors.red),
        Container(color: Colors.orange),
      ],
    );
  }
}
