import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/data/models/news_models.dart';
import 'package:news_flutter/app/modules/home/views/card_widget.dart';
import 'package:news_flutter/app/modules/homeIndex/controllers/home_index_controller.dart';

class ArticleSearch extends SearchDelegate<Articles> {
  final controller = Get.find<HomeIndexController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () async {
            var data = await controller.fetchQueryData(query);
            // print(data?.articles);
          },
          icon: const Icon(Icons.search)),
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Obx(
      () {
        return controller.resultSearch[0].articles.isEmpty
            ? const SizedBox()
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: controller.resultSearch[0].articles.length,
                itemBuilder: (context, index) {
                  var data = controller.resultSearch[0].articles[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                    child: CardWidget(data),
                  );
                },
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchQueryData(query),
      builder: (context, AsyncSnapshot<NewsModel?> snapshot) {
        var data = snapshot.data?.articles;
        if (!snapshot.hasData) {
          return const Center(child: Text(''));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: snapshot.data?.articles.length,
          itemBuilder: (BuildContext context, int index) {
            var results = snapshot.data?.articles[index];
            return CardWidget(results!);
          },
        );
      },
    );
  }
}
