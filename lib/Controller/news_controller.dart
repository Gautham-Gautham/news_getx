import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news/Controller/api_helper.dart';

import '../Model/news_model.dart';

class NewsController extends GetxController {
  final box = GetStorage();
  int currentIndx = 0;

  void changeThemeMode() {
    String? theme = box.read("theme");
    if (theme == null || theme == 'dark') {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
    }
  }

  IconData iconTheme() {
    String? theme = box.read("theme");
    if (theme == null || theme == "dark") {
      return Icons.dark_mode;
    } else {
      return Icons.light_mode_outlined;
    }
  }

  void changeBottomIndex({required int indx}) {
    currentIndx = indx;
    update();
  }

  NewsHelper newsHelper = NewsHelper();
  List<NewsModel> list = [];
  Future<void> getHeadlines() async {
    list = await newsHelper.getHeadLines();
    update();
  }

  List<NewsModel> categoryList = [];
  Future<List<NewsModel>> getCategory({required String category}) async {
    categoryList = [];
    categoryList = await newsHelper.getNewsCategory(category: category);
    return categoryList;
  }

  @override
  void onInit() {
    getHeadlines();
    super.onInit();
  }
}
