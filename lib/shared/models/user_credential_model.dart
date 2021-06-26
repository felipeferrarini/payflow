import 'dart:convert';

class UserCredentialModel {
  final String? accessToken;
  final String? idToken;

  UserCredentialModel({
    this.accessToken,
    this.idToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'idToken': idToken,
    };
  }

  factory UserCredentialModel.fromMap(Map<String, dynamic> map) {
    return UserCredentialModel(
      accessToken: map['accessToken'],
      idToken: map['idToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCredentialModel.fromJson(String source) =>
      UserCredentialModel.fromMap(json.decode(source));
}
