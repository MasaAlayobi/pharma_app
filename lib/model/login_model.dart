// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class loginModel {
  int mobile;
  String password;
  loginModel({
    required this.mobile,
    required this.password,
  });
  

  loginModel copyWith({
    int? mobile,
    String? password,
  }) {
    return loginModel(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mobile': mobile,
      'password': password,
    };
  }

  factory loginModel.fromMap(Map<String, dynamic> map) {
    return loginModel(
      mobile: map['mobile'] as int,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory loginModel.fromJson(String source) => loginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'loginModel(mobile: $mobile, password: $password)';

  @override
  bool operator ==(covariant loginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.mobile == mobile &&
      other.password == password;
  }

  @override
  int get hashCode => mobile.hashCode ^ password.hashCode;
}
