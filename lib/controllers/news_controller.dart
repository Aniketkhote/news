import 'package:get/get.dart';
import 'package:news/models/news_model.dart';
import 'package:news/services/news_api.dart';

class NewsController extends GetxController {
  var newsList = List<NewsModel>.empty().obs;
  var categoryNewsList = List<NewsModel>.empty().obs;
  var bookmarkNewsList = List<NewsModel>.empty().obs;
  var isLoading = true.obs;
  var news;
  var categoryNews;
  List _category = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  List get category => this._category;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    news = await featchNews();
    try {
      isLoading(true);

      if (news != null) {
        for (var item in news["articles"]) {
          newsList.add(NewsModel.fromJson(item));
        }
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  getCategoryNews(String cat) async {
    categoryNewsList.clear();
    news = await featchCategoryNews(cat);
    try {
      isLoading(true);

      if (news != null) {
        for (var item in news["articles"]) {
          categoryNewsList.add(NewsModel.fromJson(item));
        }
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }
}
