import 'package:flutter/material.dart';

class ColumnRowWidget extends StatelessWidget {
  const ColumnRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: [
          /// 상단
          /// Row는 가로로 배치하는 위젯
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _container(100, 120, Colors.red),
              _container(150, 100, Colors.yellow),
            ],
          ),

          /// 중단
          /// Expanded는 가능한 영역을 최대한 확장
          /// 컬럼 안에 있는 로우를, 세로 영역을 최대치로 확장
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _container(170, 170, Colors.white),
              ],
            ),
          ),

          /// 하단
          SizedBox(
            height: 60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Column Row example",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "더조은컴퓨터학원",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
