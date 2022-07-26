import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:news_flutter/app/data/models/news_models.dart';

class NewsProvider {
  List<String> randomQuery = [
    'games',
    'football',
    'weather',
    'bitcoin',
    'crypto'
  ];
  Map<String, dynamic> headers = {
    "Authorization": "57b829578524416c80edbd8eef9e32b9",
    "Content-Type": "application/json"
  };

  String baseUrl = 'https://newsapi.org/v2/everything';
  final dio = Dio();

  // Future getEverythingNews() async {
  //   String randomize = randomQuery[Random().nextInt(randomQuery.length)];
  //   var response = await dio.get(baseUrl,
  //       options: Options(
  //         headers: {
  //           "Authorization": "57b829578524416c80edbd8eef9e32b9",
  //         },
  //       ));
  //   var results = ResponseType.json;
  //   print(response.data);
  //   // List<Articles> resultsData = res
  // }

  Future<NewsModel?> getData() async {
    String randomize = randomQuery[Random().nextInt(randomQuery.length)];

    var response = await dio.get(
      baseUrl,
      queryParameters: {'q': randomize},
      options: Options(
        headers: headers,
      ),
    );
    // print(response.data);
    // var data = json.encode(response.data);
    // print(data);

    NewsModel newData = NewsModel.fromJson(response.data);

    return newData;
  }

  Future<NewsModel?> getDataWithQuery(String query) async {
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: {'q': query},
        options: Options(
          headers: headers,
        ),
      );

      return NewsModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.defaultDialog(
        middleText: e.message,
        textConfirm: 'Ok',
        onConfirm: () {
          Get.back();
        },
      );
      return null;
    }
  }
}
