import 'package:get/get.dart';
import 'package:getx_news/Model/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadLines() async {
    Response response = await get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=5b92e449f56a4311bb3718444e7527ee");
    List data = response.body['articles'];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
    print(response.body);
  }

  Future<List<NewsModel>> getNewsCategory({required String category}) async {
    Response response = await get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5b92e449f56a4311bb3718444e7527ee ");
    List data = response.body['articles'];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
    print(response.body);
  }
}
