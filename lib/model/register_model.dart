// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class registerModel {
  String username;
  String password;
  num mobile;
  String shop_name;
  registerModel({
    required this.username,
    required this.password,
    required this.mobile,
    required this.shop_name,
  });
  

  registerModel copyWith({
    String? username,
    String? password,
    num? mobile,
    String? shop_name,
  }) {
    return registerModel(
      username: username ?? this.username,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      shop_name: shop_name ?? this.shop_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'mobile': mobile,
      'shop_name': shop_name,
    };
  }

  factory registerModel.fromMap(Map<String, dynamic> map) {
    return registerModel(
      username: map['username'] as String,
      password: map['password'] as String,
      mobile: map['mobile'] as num,
      shop_name: map['shop_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory registerModel.fromJson(String source) => registerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'registerModel(username: $username, password: $password, mobile: $mobile, shop_name: $shop_name)';
  }

  @override
  bool operator ==(covariant registerModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password &&
      other.mobile == mobile &&
      other.shop_name == shop_name;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      password.hashCode ^
      mobile.hashCode ^
      shop_name.hashCode;
  }
}
