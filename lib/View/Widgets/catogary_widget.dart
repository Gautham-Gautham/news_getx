import 'package:flutter/material.dart';
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
            // isScrollable: true,
            tabs: CategoryList.categoryItems.map((e) {
              return Container(
                child: Text(e),
              );
            }).toList()),
        Expanded(
          child: TabBarView(
              controller: cont,
              children: CategoryList.categoryItems.map((e) {
                return ListItems();
              }).toList()),
        )
      ],
    );
  }
}
