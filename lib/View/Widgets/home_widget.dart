import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/Controller/news_controller.dart';

import 'list_items.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  // final cont = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (controller) {
        return ListItems(
          list: controller.list,
        );
      },
    );
  }
}
