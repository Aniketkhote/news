import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/news_controller.dart';
import 'package:news/views/news_page.dart';
import 'package:news/widgets/news_card.dart';

class CategoryNewsPage extends StatefulWidget {
  final String category;
  CategoryNewsPage({Key key, this.category}) : super(key: key);

  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  final NewsController _controller = Get.find();

  _getNews() async {
    await _controller.getCategoryNews(widget.category.toString());
  }

  @override
  void initState() {
    _getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          widget.category.capitalize,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: buildNews(),
      ),
    );
  }

  SingleChildScrollView buildNews() {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controller.categoryNewsList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Get.to(
                  NewsPage(url: _controller.categoryNewsList[index].url)),
              child: buildNewsCard(
                title: _controller.categoryNewsList[index].title ?? "",
                excerpt: _controller.categoryNewsList[index].description ?? "",
                imgUrl: _controller.categoryNewsList[index].urlToImage ??
                    "https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
