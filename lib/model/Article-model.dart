class ListOfArticleModel {
  ListOfArticleModel({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.listofarticles,
  });

  String status, copyright, section;
  DateTime lastUpdated;
  int numResults;
  List<dynamic> listofarticles;

  factory ListOfArticleModel.fromJson(Map<String, dynamic> json) =>
      ListOfArticleModel(
        status: json["status"],
        copyright: json["copyright"],
        section: json["section"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        numResults: json["num_results"],
        listofarticles: json["results"],
      );
}

class Article {
  Article({
    this.section,
    this.title,
    this.result,
    this.abstract,
    this.url,
    this.byline,
    this.createdDate,
    this.publishedDate,
    this.multimedia,
  });
  String section, title, result, abstract, url, byline;
  DateTime createdDate, publishedDate;
  List<dynamic> multimedia;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        section: json["section"],
        title: json["title"],
        result: json["result"],
        abstract: json["abstract"],
        url: json["url"],
        byline: json["byline"],
        createdDate: DateTime.parse(json["created_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        multimedia: json["multimedia"],
      );
}

class Multimedia {
  Multimedia({this.url});
  String url;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
      );
}
