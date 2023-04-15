import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    /// 바텀시트에 사용할 수 있는 컨트롤러
    animationController = BottomSheet.createAnimationController(this);
    animationController.addListener(() {
      debugPrint(animationController.value.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheetScreen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showBottomSheet();
            },
            child: const Text("바텀시트 호출")),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      transitionAnimationController: animationController,
      context: context,
      // elevation: 150,

      /// 바텀시트 드래그 가능 여부 설정
      enableDrag: true,

      isDismissible: true,

      barrierColor: Colors.grey.withOpacity(0.5),

      backgroundColor: Colors.blue.shade200,

      // shape: CircleBorder(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      constraints: const BoxConstraints(
        minWidth: 300,
        minHeight: 100,
        maxWidth: 500,
        maxHeight: 1000,
      ),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                animationController.animateBack(0.2);
              },
              child: const Text("버튼 0.3"),
            ),
          ],
        );
      },
    );
  }
}
