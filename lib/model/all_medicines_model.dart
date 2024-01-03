// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:medicine_warehouse/model/medicines_model.dart';

class AllMedicies {
  String id;
  List<medicines_model> allMedicies;
  AllMedicies({
    required this.id,
    required this.allMedicies,
  });
  

  AllMedicies copyWith({
    String? id,
    List<medicines_model>? allMedicies,
  }) {
    return AllMedicies(
      id: id ?? this.id,
      allMedicies: allMedicies ?? this.allMedicies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'allMedicies': allMedicies.map((x) => x.toMap()).toList(),
    };
  }

  factory AllMedicies.fromMap(Map<String, dynamic> map) {
    return AllMedicies(
      id: map['id'] as String,
      allMedicies: List<medicines_model>.from((map['allMedicies'] as List<dynamic>).map<medicines_model>((x) => medicines_model.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllMedicies.fromJson(String source) => AllMedicies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AllMedicies(id: $id, allMedicies: $allMedicies)';

  @override
  bool operator ==(covariant AllMedicies other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      listEquals(other.allMedicies, allMedicies);
  }

  @override
  int get hashCode => id.hashCode ^ allMedicies.hashCode;
}
