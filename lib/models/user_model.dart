class UserModel {
  String name;
  String email;
  String? number;
  UserModel({
    required this.name,
    required this.email,
    this.number,
  });
}
