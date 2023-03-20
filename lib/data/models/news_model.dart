// ignore_for_file: non_constant_identifier_names

class News {
  // Declare the variables and data types
  final int id;
  final String title;
  final String slug;
  final String brief_overview;
  final String content;
  final String reading_time;
  final String status;
  final String code_organization;
  final String author;
  final String scope;
  final String created_at;
  final List<dynamic> galleries;

  // Constructor
  News({
    this.id = -1,
    this.title = '',
    this.slug = '',
    this.brief_overview = '',
    this.content = '',
    this.reading_time = '',
    this.status = '',
    this.code_organization = '',
    this.author = '',
    this.scope = '',
    this.created_at = '',
    this.galleries = const [],
  });

  // Method to convert the JSON data to a News object
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      brief_overview: json['brief_overview'],
      content: json['content'],
      reading_time: json['reading_time'],
      status: json['status'],
      code_organization: json['code_organization'],
      author: json['author'],
      scope: json['scope'],
      created_at: json['created_at'],
      galleries: List<dynamic>.from(json['galleries']),
    );
  }
}
