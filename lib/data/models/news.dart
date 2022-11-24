class NewsModel {
  final List<Articles> articles;

  NewsModel({required this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      articles: List<Articles>.from(
          json["articles"].map((x) => Articles.fromJson(x))));
}

class Articles {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Articles(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        author: json['author']??"",
        title: json['title']??"",
        description: json['description']??"",
        url: json['url']??"",
        urlToImage: json['urlToImage']??"https://png.pngtree.com/png-vector/20190223/ourlarge/pngtree-vector-picture-icon-png-image_695350.jpg",
        publishedAt:DateTime.parse(json['publishedAt']) ,
        content: json['content']??"",
      );
}
