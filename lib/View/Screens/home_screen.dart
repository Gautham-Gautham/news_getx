import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/Controller/news_controller.dart';
import 'package:getx_news/View/Widgets/catogary_widget.dart';
import 'package:getx_news/View/Widgets/home_widget.dart';

double h = 0.0;
double w = 0.0;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final control = Get.put(NewsController());
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    w = Get.width;
    h = Get.height;
    return
        // PopScope(
        //   canPop: false,
        //   onPopInvoked: (didPop) async {
        //     // if (!didPop) {
        //     await Get.dialog(AlertDialog(
        //       title: Text("Closing the app"),
        //       content: Text("Are you sure?"),
        //       actions: [
        //         ElevatedButton(
        //             onPressed: () {
        //               Get.back(result: true);
        //             },
        //             child: Text("Close")),
        //         ElevatedButton(
        //             onPressed: () {
        //               Get.back(result: false);
        //             },
        //             child: Text("No"))
        //       ],
        //     ));
        //     //   if (res) {
        //     //     Get.back();
        //     //   }
        //     // }
        //   },
        //   child: Scaffold(
        //     appBar: AppBar(),
        //   ));
        WillPopScope(
            onWillPop: () async {
              return await Get.dialog(AlertDialog(
                title: Text("Closing the app"),
                content: Text("Are you sure?"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back(result: true);
                      },
                      child: Text("Close")),
                  ElevatedButton(
                      onPressed: () {
                        Get.back(result: false);
                      },
                      child: Text("No"))
                ],
              ));
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "News App",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        control.changeThemeMode();
                      },
                      icon: Icon(control.iconTheme()))
                ],
              ),
              body: Column(
                children: [
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        control.changeBottomIndex(indx: value);
                      },
                      children: [HomeWidget(), CategoryWidget()],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: GetBuilder<NewsController>(
                builder: (controller) => BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: control.currentIndx,
                    onTap: (value) {
                      control.changeBottomIndex(indx: value);
                      pageController.jumpToPage(value);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_max_outlined),
                          activeIcon: Icon(Icons.home),
                          label: 'Home',
                          tooltip: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category_outlined),
                          activeIcon: Icon(Icons.category),
                          label: 'Category',
                          tooltip: 'Category')
                    ]),
              ),
            ));
  }
}
