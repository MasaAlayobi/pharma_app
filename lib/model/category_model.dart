// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:medicine_warehouse/model/all_medicines_model.dart';
import 'package:medicine_warehouse/model/medicines_model.dart';
import 'package:medicine_warehouse/screen/medicines/medication_details.dart';

class CategoryModel {
  String category_name;
  List<medicines_model> AllMediciesInCategory;
  CategoryModel({
    required this.category_name,
    required this.AllMediciesInCategory,
  });
  

  CategoryModel copyWith({
    String? category_name,
    List<medicines_model>? AllMediciesInCategory,
  }) {
    return CategoryModel(
      category_name: category_name ?? this.category_name,
      AllMediciesInCategory: AllMediciesInCategory ?? this.AllMediciesInCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category_name': category_name,
      'AllMediciesInCategory': AllMediciesInCategory.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category_name: map['category_name'] as String,
      AllMediciesInCategory: List<medicines_model>.from((map['AllMediciesInCategory'] as List<dynamic>).map<medicines_model>((x) => medicines_model.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(category_name: $category_name, AllMediciesInCategory: $AllMediciesInCategory)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.category_name == category_name &&
      listEquals(other.AllMediciesInCategory, AllMediciesInCategory);
  }

  @override
  int get hashCode => category_name.hashCode ^ AllMediciesInCategory.hashCode;
}
