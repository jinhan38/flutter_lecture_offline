import 'package:flutter/material.dart';

class UiExam1Review extends StatefulWidget {
  const UiExam1Review({Key? key}) : super(key: key);

  @override
  State<UiExam1Review> createState() => _UiExam1ReviewState();
}

class _UiExam1ReviewState extends State<UiExam1Review> {
  // viewport 화면에 보이는 영역
  //
  final PageController pageController = PageController(viewportFraction: 0.9);

  List<String> imageList = [
    "assets/winter.jpg",
    "assets/winter.jpg",
    "assets/winter.jpg",
    "assets/winter.jpg",
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _top(),
            const SizedBox(height: 10),
            _middle(),
            const SizedBox(height: 10),
            _bottom(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      title: const Text("복잡한 UI"),
      centerTitle: true,
      // 왼쪽에 넣는 위젯
      // leading: ,

      // back 버튼 자동 생성 여부
      // automaticallyImplyLeading: false,

      actions: [
        // Button 종류들은 기본적으로 간격이 들어가 있음
        IconButton(
          onPressed: () {
            debugPrint("+ 버튼 클릭");
          },
          icon: const Icon(Icons.add),
        ),

        /// GestureDetector는 기본적으로
        /// child의 영역만 클릭
        /// 효과가 없음
        GestureDetector(
          onTap: () {
            debugPrint("- 버튼 클릭 : ${DateTime.now()}");
          },
          child: const Icon(
            Icons.remove,
            size: 30,
          ),
        ),

        /// 물결처럼 퍼지는 효과가 있음
        /// splash, ripple
        InkWell(
          onTap: () {},
          splashColor: Colors.red,
          // highlightColor: Colors.green,

          // 물결 퍼지는거 없애고, 클릭 컬러만 나옴
          // overlayColor: MaterialStateProperty.all(Colors.yellow),

          // focusColor, hoverColor 모바일에서는 볼 수 없음
          // 버튼을 클릭하고 tap 누르면 확인 가능
          // overlayColor 특성이 hoverColor보다 우선
          focusColor: Colors.orange,
          hoverColor: Colors.purple,

          customBorder: const CircleBorder(),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }

  Widget _top() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시", Colors.black, () {
              debugPrint("택시 클릭");
            }),
            iconItem("블랙", Colors.red, () {
              debugPrint("블랙 클릭");
            }),
            iconItem("바이크", Colors.orange, () {
              debugPrint("바이크 클릭");
            }),
            iconItem("대리", Colors.yellow, () {
              debugPrint("대리 클릭");
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시", Colors.green, () {
              debugPrint("택시 클릭");
            }),
            iconItem("블랙", Colors.blue, () {
              debugPrint("블랙 클릭");
            }),
            iconItem("바이크", Colors.indigo, () {
              debugPrint("바이크 클릭");
            }),
            SizedBox(width: 80),
          ],
        ),
      ],
    );
  }

  // // 함수
  // // 함수 이름은 aa
  // aa() {}

  Widget iconItem(
    String text,
    Color color,
    Function() onPressed,
  ) {
    return SizedBox(
      width: 80,
      height: 80,
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          foregroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
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
  }

  Widget _middle() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(imageList[index]).image,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bottom() {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            debugPrint('$index 번째 항목 클릭');
          },
          child: SizedBox(
            height: 60,
            child: Row(
              children: const [
                SizedBox(width: 20),
                Icon(Icons.notifications_none_sharp),
                SizedBox(width: 20),
                Text("[이벤트] 이것은 공지사항입니다.")
              ],
            ),
          ),
        );
      },
    );
  }
}
