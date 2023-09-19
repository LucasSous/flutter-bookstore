class UserModel {
  int? id;
  String name;
  String address;
  String city;
  String email;

  UserModel({
    this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.email,
  });
}
