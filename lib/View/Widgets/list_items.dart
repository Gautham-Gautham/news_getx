import 'package:flutter/material.dart';

import '../../Model/news_model.dart';
import '../Screens/home_screen.dart';

class ListItems extends StatelessWidget {
  ListItems({super.key, required this.list});
  final List<NewsModel> list;
  @override
  Widget build(BuildContext context) {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(4),
            height: h * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(list[index].urlToImage!),
                    fit: BoxFit.cover)),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              padding: EdgeInsets.all(10),
              child: Text(
                list[index].title!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          );
        },
        itemCount: 5,
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
