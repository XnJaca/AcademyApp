import 'dart:convert';

class User {
  int id;
  String name;
  String lastName;
  String secondLastName;
  int phone;
  String email;
  String password;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.secondLastName,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory User.fromJsons(String str) => User.fromMap(json.decode(str));

  factory User.fromJson(String jsonStr) {
    Map<String, dynamic> decoded = json.decode(jsonStr);
    return decoded["result"]["value"]
        .map<User>((e) => User.fromMap(e));
  }

  // **Toma toda la instancia de la clase y la devuelve en un JSON **
  // String toJson() => json.encode(toMap());
//  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
      id: json['Id'],
      name: json['Name'],
      lastName: json['LastName'],
      secondLastName: json['SecondLastName'],
      phone: json['Phone'],
      email: json['Email'],
      password: json['Password']);
}
