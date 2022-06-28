import 'dart:math';

import 'package:dio/dio.dart';

import 'package:news_flutter/app/data/models/news_models.dart';

class NewsProvider {
  List<String> randomQuery = [
    'games',
    'football',
    'weather',
    'bitcoin',
    'crypto'
  ];

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

    Response response = await dio.get(
      baseUrl,
      queryParameters: {'q': randomize},
      options: Options(
        headers: {
          "Authorization": "57b829578524416c80edbd8eef9e32b9",
          "Content-Type": "application/json"
        },
      ),
    );
    // print(response.data);
    // var data = json.encode(response.data);
    // print(data);

    NewsModel newData = NewsModel.fromJson(response.data);

    return newData;
  }
}
