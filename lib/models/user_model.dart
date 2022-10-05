class UserModel {
  String id;
  String name;
  String email;
  String? number;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.number,
  });
}
