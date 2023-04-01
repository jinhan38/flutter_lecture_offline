import 'package:flutter/material.dart';

class TextFormFieldScreen extends StatefulWidget {
  const TextFormFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFormFieldScreen> createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<TextFormFieldScreen> {
  // Type = TextEditingController
  // 변수명 = controller
  // TextEditingController의 역할
  // TextFormField 위젯의 행동을 알 수 있다.
  final TextEditingController controller = TextEditingController();

  // 화면이 생성될 때 1번만 호출 되는 함수
  @override
  void initState() {
    // addListener = controller를 붙인 TextFormField의 값이
    // 변경 될 때 마다 호출됩니다.
    controller.addListener(() {
      // print('controller : ${controller.text}');
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFormFieldScreen"),

        // true : back 버튼 자동으로 보여줌
        // false : back 버튼 자동으로 보여주지 않음
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          body(),
          TextFormField(),
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        // 생성한 TextEditingController를 TextFormField에 붙였다.
        controller: controller,
        style: const TextStyle(fontSize: 20),
        cursorColor: Colors.pink,
        cursorWidth: 5,
        // cursorHeight: 35,

        // 화면에 보여지는 line의 개수
        maxLines: 3,

        maxLength: 10,

        // 글자가 바뀔 때 마다 호출
        onChanged: (value) {
          print('value : $value');
        },

        cursorRadius: const Radius.circular(3),
        decoration: InputDecoration(
          // hint : 글자를 입력하지 않았을 때 보여주는 문구
          hintText: "아이디를 입력하세요",
          hintStyle: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          hintMaxLines: 1,
          enabled: true,

          // TextFormField 활성화 됐을 때(사용 가능할 때)
          enabledBorder: customBorder(5, Colors.cyan),

          // focus가 잡혔을 때, 커서 깜빡일 때
          focusedBorder: customBorder(2, Colors.green),

          // errorBorder가 나오는 조건 :  errorText에 값을 입력해야한다.
          // errorBorder가 안나오는 조건 :
          // 1. errorText를 사용하지 않는 경우
          // 2. errorText에 null을 넣어주는 경우
          //
          // 기획 조건 : 6글자 미만인 경우 에러 문구를 보여주고 싶다.
          // 아무것도 입력하지 않은 경우에 에러 문구를 안보여준다.
          errorBorder: customBorder(2, Colors.red),

          // focus는 커서가 있는 경우
          // focusedErrorBorder를 구현하지 않으면
          // 기본 errorBorder 적용됩니다.
          focusedErrorBorder: customBorder(5, Colors.red),
          contentPadding: const EdgeInsets.all(16),
          errorText: checkErrorText(),
          errorStyle: const TextStyle(fontSize: 13),
          errorMaxLines: 1,
        ),
      ),
    );
  }

  /// InputBorder 함수
  InputBorder customBorder(double width, Color color) {
    // outline, 사각형의 테두리 border
    return OutlineInputBorder(
        borderSide: BorderSide(width: width, color: color),
        borderRadius: BorderRadius.circular(20));

    // 밑줄만 있는 border
    return UnderlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
    );
  }

  /// ? 기호가 있으면 null을 의미한다.
  /// String? = String 타입이거나 null
  /// return할 수 있는 값은 String이거나 null 입니다.
  String? checkErrorText() {
    // // 글자 체크
    // // 1.
    // if (controller.text == "") {}
    //
    // // 글자 체크
    // // 2. lenght 길이 의미
    // // 아무것도 안 쓴 경우 길이 0
    // if (controller.text.length == 0) {}

    // 글자 체크
    // 3. empty의 뜻은 비어 있다.
    // 비어있으면 true, 한글자라도 있으면 false 리턴
    if (controller.text.isEmpty) {
      // print('isEmpty');
      return null;
    }

    // 글자수가 6개 미만인 경우
    if (controller.text.length < 6) {
      // print('6글자 미만');
      return "6글자 이상 입력해주세요.";
    }

    // print('6글자 이상');
    return null;
  }
}
