import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/routes/app_pages.dart';

class CardWidget extends StatelessWidget {
  final Articles articles;

  CardWidget(this.articles);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAILS, arguments: [articles]);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage!,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles.title,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Written by : ${articles.source.name}",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w800),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
