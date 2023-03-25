import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 300,
        color: Colors.grey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _container(100, 50, Colors.red, 10),
            _container(100, 10, Colors.blue, 20),
            _container(100, 10, Colors.green, 30),
          ],
        ),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: _container(100, 200, Colors.amberAccent, 14),
        ),

        const Spacer(flex: 1),

        /// Expanded
        /// 가능한 영역 안에서 크기 최대화
        _container(100, 100, Colors.cyanAccent, 24),

        const Spacer(flex: 1),

        _container(100, 100, Colors.brown, 30),
      ],
    );
  }

  Widget _container(double width, double height, Color color, double radius) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
