class TopSiteContent {
  String title;
  String description;
  String url;
  String image;

  TopSiteContent({this.title, this.description, this.url, this.image});

  static TopSiteContent fromJson(Map<String, dynamic> json) {
    return TopSiteContent(
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      image: json['image'] as String
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'url': url,
    'image': image
  };
}