import 'package:flutter/material.dart';

class UiExam1 extends StatefulWidget {
  const UiExam1({Key? key}) : super(key: key);

  @override
  State<UiExam1> createState() => _UiExam1State();
}

class _UiExam1State extends State<UiExam1> {
  final PageController pageController = PageController(viewportFraction: 0.85);

  List<String> imageList = [
    "assets/winter.jpg",
    "assets/winter.jpg",
    "assets/winter.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text("복잡한 UI"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _top(),
            const SizedBox(height: 20),
            _middle((index) {
              debugPrint("$index 번째 이미지 클릭");
            }),
            const SizedBox(height: 20),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    // return GridView.count(
    //   shrinkWrap: true,
    //    padding: const EdgeInsets.symmetric(horizontal: 20),
    //    crossAxisCount: 4,
    //    mainAxisSpacing: 0,
    //    crossAxisSpacing: 0,
    //    childAspectRatio: 1,
    //    children: [
    //      iconItem("택시"),
    //      iconItem("블랙"),
    //      iconItem("바이크"),
    //      iconItem("대리"),
    //      iconItem("택시"),
    //      iconItem("블랙"),
    //      iconItem("바이크"),
    //    ],
    //  );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시", () {
              debugPrint('택시 클릭');
            }),
            iconItem("블랙", () {
              debugPrint('블랙 클릭');
            }),
            iconItem("바이크", () {
              debugPrint('바이크 클릭');
            }),
            iconItem("대리", () {
              debugPrint('대리 클릭');
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시", () {
              debugPrint('택시 클릭');
            }),
            iconItem("블랙", () {
              debugPrint('블랙 클릭');
            }),
            iconItem("바이크", () {
              debugPrint('바이크 클릭');
            }),
            const SizedBox(width: 80),
            // iconItem("대리"),
          ],
        )
      ],
    );
  }

  Widget iconItem(String text, Function() onPressed) {
    return SizedBox(
      width: 80,
      height: 80,
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_taxi,
              size: 40,
            ),
            Text(text),
          ],
        ),
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     IconButton(
    //       onPressed: () {},
    //       icon: const Icon(
    //         Icons.local_taxi,
    //         size: 32,
    //       ),
    //     ),
    //     Text(text),
    //   ],
    // );
  }

  Widget _middle(Function(int index) onTap) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: image(imageList[index]),
          );
        },
        itemCount: imageList.length,
      ),
    );

    // return SizedBox(
    //   height: 200,
    //   child: PageView(
    //     controller: pageController,
    //     children: [
    //       List.generate(imageList.length, (index) => null)
    //     ],
    //   ),
    // );
  }

  Widget image(String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: Image.asset(url, fit: BoxFit.cover).image,
          fit: BoxFit.cover,
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 5),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: Image.asset(
    //       "assets/winter.jpg",
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );
  }

  Widget _bottom() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            debugPrint("알림 목록 $index");
          },
          child: SizedBox(
            height: 60,
            child: Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.notifications_none_sharp),
                SizedBox(width: 20),
                Text("[이벤트]이것은 공지사항입니다.")
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
