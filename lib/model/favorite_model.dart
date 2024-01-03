// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class favoriteModel {
  int medicine_id;
  favoriteModel({
    required this.medicine_id,
  });

  favoriteModel copyWith({
    int? medicine_id,
  }) {
    return favoriteModel(
      medicine_id: medicine_id ?? this.medicine_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicine_id': medicine_id,
    };
  }

  factory favoriteModel.fromMap(Map<String, dynamic> map) {
    return favoriteModel(
      medicine_id: map['medicine_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory favoriteModel.fromJson(String source) => favoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'favoriteModel(medicine_id: $medicine_id)';

  @override
  bool operator ==(covariant favoriteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.medicine_id == medicine_id;
  }

  @override
  int get hashCode => medicine_id.hashCode;
}
