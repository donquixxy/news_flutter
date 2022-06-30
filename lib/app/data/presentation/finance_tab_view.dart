import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:news_flutter/app/modules/home/views/card_widget.dart';

class FinanceView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.financeData[0].articles.length,
      itemBuilder: (context, index) {
        var articlesData = controller.financeData[0].articles[index];
        return CardWidget(articlesData);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
