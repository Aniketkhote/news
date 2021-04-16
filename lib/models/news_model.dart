class NewsModel {
  String title;
  String description;
  String urlToImage;
  String url;

  NewsModel({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.description = json['description'];
    this.urlToImage = json['urlToImage'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['urlToImage'] = urlToImage;
    data['url'] = url;
    return data;
  }
}
