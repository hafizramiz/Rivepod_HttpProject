// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserRequestModel {
  String? email;
  String? password;
  UserRequestModel({
    this.email,
    this.password,
  });

  UserRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return UserRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory UserRequestModel.fromMap(Map<String, dynamic> map) {
    return UserRequestModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRequestModel.fromJson(String source) =>
      UserRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserRequestModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant UserRequestModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
