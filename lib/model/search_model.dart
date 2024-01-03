// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class searchModel {
  String name;
  searchModel({
    required this.name,
  });
  

  searchModel copyWith({
    String? name,
  }) {
    return searchModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory searchModel.fromMap(Map<String, dynamic> map) {
    return searchModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory searchModel.fromJson(String source) => searchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'searchModel(name: $name)';

  @override
  bool operator ==(covariant searchModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
