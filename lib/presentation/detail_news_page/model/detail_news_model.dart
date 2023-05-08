// ignore_for_file: non_constant_identifier_names

class DetailNewsModel {
  final String id;
  final String user_id;
  final String title;
  final String slug;
  final String brief_overview;
  final String content;
  final String reading_time;
  final String status;
  final String deleted_at;
  final String created_at;
  final String updated_at;

  DetailNewsModel({
    required this.id,
    required this.user_id,
    required this.title,
    required this.slug,
    required this.brief_overview,
    required this.content,
    required this.reading_time,
    required this.status,
    required this.deleted_at,
    required this.created_at,
    required this.updated_at,
  });

  factory DetailNewsModel.fromJson(Map<String, dynamic> json) {
    return DetailNewsModel(
      id: json['id'],
      user_id: json['user_id'],
      title: json['title'],
      slug: json['slug'],
      brief_overview: json['brief_overview'],
      content: json['content'],
      reading_time: json['reading_time'],
      status: json['status'],
      deleted_at: json['deleted_at'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
