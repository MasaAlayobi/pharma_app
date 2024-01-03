// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:medicine_warehouse/model/medicines_model.dart';

class category {
  List<medicines_model> medList;
  category({
    required this.medList,
  });

  category copyWith({
    List<medicines_model>? medList,
  }) {
    return category(
      medList: medList ?? this.medList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medList': medList.map((x) => x.toMap()).toList(),
    };
  }

  factory category.fromMap(Map<String, dynamic> map) {
    return category(
      medList: List<medicines_model>.from((map['medList'] as List<int>).map<medicines_model>((x) => medicines_model.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory category.fromJson(String source) => category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'category(medList: $medList)';

  @override
  bool operator ==(covariant category other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.medList, medList);
  }

  @override
  int get hashCode => medList.hashCode;
}
