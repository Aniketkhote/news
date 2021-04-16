import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:news/controllers/news_controller.dart';
import 'package:news/views/news_page.dart';
import 'package:news/widgets/news_card.dart';
import 'package:customize/customize.dart';

class BookmarkPage extends StatelessWidget {
  final NewsController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("Bookmark").color(Colors.black).xl.extraBold,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.bookmarkNewsList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Get.to(
                      NewsPage(url: _controller.bookmarkNewsList[index].url)),
                  child: buildNewsCard(
                    title: _controller.bookmarkNewsList[index].title ?? "",
                    excerpt:
                        _controller.bookmarkNewsList[index].description ?? "",
                    imgUrl: _controller.bookmarkNewsList[index].urlToImage ??
                        "https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
