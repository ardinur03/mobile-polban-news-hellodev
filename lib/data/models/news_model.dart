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
  final String logo;
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
    this.logo = '',
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
      logo: json['logo'] ??
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F75%2F14%2F1f%2F75141f277ba73fd5bbd7c48ae36506eb.jpg&f=1&nofb=1&ipt=c8c701a9697f7f1304ea2b7c820dd150793113fde63ee41f1f758f95a2cbb7e2&ipo=images',
      galleries: List<dynamic>.from(json['galleries']),
    );
  }
}
