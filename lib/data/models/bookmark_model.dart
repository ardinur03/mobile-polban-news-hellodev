// ignore_for_file: non_constant_identifier_names

class Bookmark {
  final int id_bookmark;
  final int id_news;
  final String title;
  final String brief_overview;
  final String slug;
  final String reading_time;

  Bookmark({
    this.id_bookmark = -1,
    this.id_news = -1,
    this.title = '',
    this.brief_overview = '',
    this.slug = '',
    this.reading_time = '',
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      id_bookmark: json['id_bookmark'],
      id_news: json['id_news'],
      title: json['title'],
      brief_overview: json['brief_overview'],
      slug: json['slug'],
      reading_time: json['reading_time'],
    );
  }
}
