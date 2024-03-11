import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/Controller/news_controller.dart';
import 'package:getx_news/Shared/constant.dart';
import 'package:getx_news/View/Widgets/list_items.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController? cont;
  final newsController = Get.put(NewsController());
  @override
  void initState() {
    cont =
        TabController(length: CategoryList.categoryItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: cont,
            isScrollable: true,
            tabs: CategoryList.categoryItems.map((e) {
              return Container(
                child: Text(e),
              );
            }).toList()),
        Expanded(
          child: TabBarView(
              controller: cont,
              children: CategoryList.categoryItems.map((e) {
                return FutureBuilder(
                  future: newsController.getCategory(category: e),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListItems(list: snapshot.data!);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }).toList()),
        )
      ],
    );
  }
}

Map a = {
  "status": "ok",
  "articles": [
    {
      "source": {"name": "Axios"},
      "author": "Axios",
      "title": "Sam Altman to return to OpenAI board - Axios",
      "description": "null",
      "url":
          "https://www.axios.com/2024/03/08/sam-altman-returns-to-openai-board",
      "urlToImage": "null",
      "publishedAt": "2024-03-09T07:20:03Z",
      "content": "null"
    },
  ]
};
