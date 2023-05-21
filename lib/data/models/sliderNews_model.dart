//Model Slider News
// ignore: camel_case_types
class sliderNews {
  // Atributte class
  // ignore: non_constant_identifier_names
  final String title;
  final String picturePath;

  sliderNews({
    // ignore: non_constant_identifier_names
    this.title = '',
    this.picturePath = '',
  });

  // Method untuk mengubah JSON menjadi sliderNews
  factory sliderNews.fromJson(Map<String, dynamic> json) {
    return sliderNews(
      title: json['title'],
      picturePath: json['picturePath'],
    );
  }
}
