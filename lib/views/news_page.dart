import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:customize/customize.dart';

class NewsPage extends StatefulWidget {
  final String url;
  NewsPage({this.url});
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("News".toUpperCase()).color(Colors.black).xl.extraBold,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () => Share.share(widget.url),
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () => null,
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: (controller) => _completer.complete(controller),
        ),
      ),
    );
  }
}
