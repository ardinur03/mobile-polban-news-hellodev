class User {
  final int id;
  final String user_code;
  final String name;
  final String email;
  final String profile_photo_path;
  final String study_name;
  final String faculty_name;
  final int cohort_year;
  final String address;
  final String phone_number;

  User({
    this.id = -1,
    this.user_code = '',
    this.name = '',
    this.email = '',
    this.profile_photo_path = '',
    this.study_name = '',
    this.faculty_name = '',
    this.cohort_year = 0,
    this.address = '',
    this.phone_number = '',
  });

  // Method to convert the JSON data to a user object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      user_code: json['user_code'],
      name: json['name'],
      email: json['email'],
      profile_photo_path: json['profile_photo_path'],
      study_name: json['study_name'],
      faculty_name: json['faculty_name'],
      cohort_year: json['cohort_year'],
      address: json['address'],
      phone_number: json['phone_number'],
    );
  }
}
