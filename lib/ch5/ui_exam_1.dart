import 'package:flutter/material.dart';

class UiExam1 extends StatefulWidget {
  const UiExam1({Key? key}) : super(key: key);

  @override
  State<UiExam1> createState() => _UiExam1State();
}

class _UiExam1State extends State<UiExam1> {
  final PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text("복잡한 UI"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _top(),
            const SizedBox(height: 20),
            _middle(),
            const SizedBox(height: 20),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시"),
            iconItem("블랙"),
            iconItem("바이크"),
            iconItem("대리"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시"),
            iconItem("블랙"),
            iconItem("바이크"),
            const SizedBox(width: 50),
            // iconItem("대리"),
          ],
        )
      ],
    );
  }

  Widget iconItem(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.local_taxi,
              size: 32,
            )),
        Text(text),
      ],
    );
  }

  Widget _middle() {
    return SizedBox(
      height: 200,
      child: PageView(
        controller: pageController,
        children: [
          image(),
          image(),
          image(),
        ],
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(child: Image.asset("assets/winter.jpg")),
      ),
    );
  }

  Widget _bottom() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 60,
          child: Row(
            children: const [
              SizedBox(width: 20),
              Icon(Icons.notifications_none_sharp),
              SizedBox(width: 20),
              Text("[이벤트]이것은 공지사항입니다.")
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
