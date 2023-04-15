import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DialogScreen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showMyDialog();
          },
          child: const Text("Dialog 호출"),
        ),
      ),
    );
  }

  void showMyDialog() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shadowColor: Colors.red,
          elevation: 10,
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
          insetAnimationDuration: Duration(milliseconds: 500),
          insetAnimationCurve: Curves.bounceOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // 뒤로가기 기능
                      Navigator.pop(context, "팝업 결과물");
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "다이얼로그",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "검색어를 입력해주세요",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("확인"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    ).then((value) {
      debugPrint("value : $value");
    });
  }
}
