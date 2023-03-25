import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Center : 영역을 최대로 확장시킨 후에,
    /// 자식 위젯은 최대로 키운다.
    return Center(
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        width: 300,
        height: 300,
        child: Text(
          "softWrap 특성을 false로 설정해야 동작.",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            // height: 5,
            // color: Colors.red,
            // backgroundColor: Colors.grey.shade400,
            // shadows: const [
            //   Shadow(
            //     color: Colors.blue,
            //     offset: Offset(-5, -5),
            //     blurRadius: 3,
            //   ),
            // ],
            // decoration: TextDecoration.lineThrough,
            // decorationThickness: 1,
            // decorationColor: Colors.black,
            // decorationStyle: TextDecorationStyle.solid,
          ),
          maxLines: 3,

          /// TextOverflow에서 fade와 visible은
          /// softWrap특성을 false로 설정해야 동작.
          overflow: TextOverflow.ellipsis,
          softWrap: true,

          /// 텍스트 크기 비율 설정
          textScaleFactor: 1.5,

          textWidthBasis: TextWidthBasis.longestLine,

          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
      ),
    );
  }
}
