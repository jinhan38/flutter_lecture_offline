import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'json_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NewsScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              getHttp();
            },
            child: const Text("dio test"),
          ),
          ElevatedButton(
            onPressed: () {
              getReadJson();
            },
            child: const Text("read json"),
          ),
          FutureBuilder(
            future: getReadJson(),
            builder: (context, snapshot) {
              // || == or
              // snapshot.hasData => snapshot이 데이터를 가지고 있는지
              // 가지고 있으면 true, 없으면 false

              //
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return Text(snapshot.data.toString());
            },
          ),
          ElevatedButton(
            onPressed: () {
              getNewsData();
            },
            child: const Text("newsApi"),
          ),

          Expanded(
            child: FutureBuilder(
              future: getNewsData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder: (context, index) {
                    String? url = snapshot.data!.articles[index].urlToImage;
                    if (url == null) {
                      return const Text("이미지 없음");
                    }
                    return Image.network(
                        snapshot.data!.articles[index].urlToImage!);
                  },
                );
              },
            ),
          ),
          // Expanded(
          //   child: FutureBuilder<JsonModel>(
          //     future: getNewData(),
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //       return list(snapshot.data!);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  final dio = Dio();

  void getHttp() async {
    final response = await dio.get('https://dart.dev');
    print(response);
  }

  Future<JsonModel> getReadJson() async {
    // response는 아직 json 형태
    final String response =
        await rootBundle.loadString("assets/json_example.json");

    // json 형태를 map 형식으로 변경해줘야합니다.
    var map = jsonDecode(response);

    JsonModel jsonModel = JsonModel.fromJson(map);
    print(jsonModel);

    await Future.delayed(const Duration(seconds: 2));

    return jsonModel;
  }

  Future<JsonModel> getNewsData() async {
    final Dio d = Dio();
    String url =
        "https://newsapi.org/v2/everything?q=Apple&from=2023-04-28&sortBy=popularity&apiKey=f4e382a85f8e45a5878357459c397275";
    var response = await d.get(url);

    var result = JsonModel.fromJson(response.data);
    print('result : $result');
    return result;
  }

  Widget list(JsonModel jsonModel) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (jsonModel.articles[index].urlToImage == null) {
          return const Text("이미지 없음");
        }
        return Image.network(jsonModel.articles[index].urlToImage!);
      },
      itemCount: jsonModel.articles.length,
    );
  }
}
