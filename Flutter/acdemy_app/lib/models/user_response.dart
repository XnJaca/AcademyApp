import 'dart:convert';

class UserResponse {
  UserResponse(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.secondLastName,
      required this.phone,
      required this.email,
      required this.password});

  int id;
  String name;
  String lastName;
  String secondLastName;
  int phone;
  String email;
  String password;

  factory UserResponse.fromJson(String str) =>
      UserResponse.fromMap(json.decode(str));

// **Toma toda la instancia de la clase y la devuelve en un JSON **
  // String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      secondLastName: json['secondLastName'],
      phone: json['phone'],
      email: json['email'],
      password: json['password']);
}
