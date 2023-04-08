import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String imageUrl =
      "https://media.cnn.com/api/v1/images/stellar/prod/210316134738-02-wisdom-project-summer.jpg?q=w_3568,h_2006,x_0,y_0,c_fill";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageScreen"),
      ),
      body: Center(
        child: _network(),
      ),
    );
  }

  /// .jpg, .png
  /// png : 배경이 투명하다. 아이콘, 이미지 등 다양하게 사용
  /// jpg : 일반적인 이미지(배경 불투명)
  /// BoxFit.contain : 이미지 비율 유지함, 가능한한 크게 그림
  /// BoxFit.cover : 이미지의 비율을 유지하면서 이미지 위젯 영역 꽉 채움
  /// 하지만 비율을 유지해야하기 때문에 이미지가 확대되는 현상 발생
  /// BoxFit.fill : 이미지의 비율은 무시, 이미지 위젯 꽉 채움
  /// BoxFit.fitHeight : 이미지 비율 유지, 이미지 위젯의 세로 너비에 맞 그립니다.
  /// 이미지의 해상도에 따라서 상하좌우가 잘려보일 수 있습니다.
  /// BoxFit.fitWidth : 이미지 비율은 유지, 이미지 위젯의 가로 너비에 맞춰 그립니다.
  /// alignment : 이미지 위젯 내에서 이미지를 어디로 배치시킬지 결정
  ///
  /// 제일 많이 사용하는 특성 : BoxFit.cover
  /// alignment : 자주 사용하지는 않음
  Widget _image() {
    return Container(
      color: Colors.blue,
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/winter2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  /// errorBuilder는 이미지가 오류난 경우 사용하는 위젯
  Widget _network() {
    return Image.network(
      imageUrl,
      errorBuilder: (context, error, stackTrace) {
        print('error : $error');
        return Text("이미지 오류");
      },
      // color: Colors.blue,
      // colorBlendMode: BlendMode.colorDodge,
    );
  }
}
