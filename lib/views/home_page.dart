import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/news_controller.dart';
import 'package:news/views/bookmark_page.dart';
import 'package:news/views/category_news_page.dart';
import 'package:news/views/news_page.dart';
import 'package:news/widgets/news_card.dart';

class HomePage extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News".toUpperCase(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
            onPressed: () => Get.to(BookmarkPage()),
          ),
        ],
      ),
      body: SafeArea(
        child: _controller.isLoading.value
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    buildCategoryChips(),
                    buildNews(),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildCategoryChips() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _controller.category.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(CategoryNewsPage(category: _controller.category[index]));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                _controller.category[index].toString().capitalize,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNews() {
    return Obx(
      () => Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _controller.newsList.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Get.to(
              NewsPage(url: _controller.newsList[index].url),
            ),
            child: buildNewsCard(
              title: _controller.newsList[index].title ?? "",
              excerpt: _controller.newsList[index].description ?? "",
              imgUrl: _controller.newsList[index].urlToImage ??
                  "https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
