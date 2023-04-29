import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../ch2/animal/item.dart';
import 'open_api_model.dart';

class OpenApiScreen extends StatefulWidget {
  const OpenApiScreen({Key? key}) : super(key: key);

  @override
  State<OpenApiScreen> createState() => _OpenApiScreenState();
}

class _OpenApiScreenState extends State<OpenApiScreen> {
  List<OpenItem> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenApiScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                call();
              },
              child: Text("call")),
          if (itemList.isEmpty) ...[
            const Center(child: CircularProgressIndicator()),
          ] else ...[
            // Expanded가 여기서 하는 역할
            // => Column의 남은 영역을 꽉 채워라
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  OpenItem item = itemList[index];
                  return Text("item category : ${item.category}, "
                      "fcstValue : ${item.fcstValue}");
                },
                itemCount: itemList.length,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void call() {
    Dio dio = Dio();
    String url =
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=4HfV1T8aU8VzP%2FDu5mUuv%2Bk4nQFIU2IfXzkw7oD7Wtd8BzpPnkZgDyzahfv9XpJDbtP%2B8S54N4yGCeFKNuZdfw%3D%3D&pageNo=1&numOfRows=5&dataType=JSON&base_date=20230428&base_time=0500&nx=55&ny=127";

    String baseUrl =
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
    String serviceKey =
        "4HfV1T8aU8VzP%2FDu5mUuv%2Bk4nQFIU2IfXzkw7oD7Wtd8BzpPnkZgDyzahfv9XpJDbtP%2B8S54N4yGCeFKNuZdfw%3D%3D";
    String pageNo = "1";
    String numOfRows = "10";
    String dataType = "JSON";
    String base_date = "20230428";
    String base_time = "0500";
    String nx = "55";
    String ny = "127";

    String u = "$baseUrl"
        "?serviceKey=$serviceKey"
        "&pageNo=$pageNo"
        "&numOfRows=$numOfRows"
        "&dataType=$dataType"
        "&base_date=$base_date"
        "&base_time=$base_time"
        "&nx=$nx"
        "&ny=$ny";

    print(u);

    setState(() {
      itemList.clear();
    });

    dio.get(u).then((value) async {

      await Future.delayed(const Duration(milliseconds: 1000));

      if (value.data != null) {
        var data = value.data["response"]["body"]["items"]["item"];
        var list = data.map<OpenItem>((e) => OpenItem.fromJson(e)).toList();
        itemList.addAll(list);
        setState(() {});
      }
    });
  }
}
