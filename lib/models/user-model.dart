import 'dart:convert';

class User {
  String name;
  String? email;
  String? address;
  String? phone;

  User({
    required this.name,
    this.email,
    this.address,
    this.phone,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'],
      address: map['address'],
      phone: map['phone'],
    );
  }

  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));
}
