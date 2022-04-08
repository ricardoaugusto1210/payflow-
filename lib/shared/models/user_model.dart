import 'dart:convert';

class UserModel {
  final String name;
  final String? photoURL;

  UserModel({required this.name, required this.photoURL});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoURL: map['photoURL']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  //
  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  // Passando o Map para json
  String toJson() => jsonEncode(toMap());
}
