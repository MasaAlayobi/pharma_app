// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ordersModel {
  int warehouse_id;
  List<int> medicines;
  List<int> amount;
  ordersModel({
    required this.warehouse_id,
    required this.medicines,
    required this.amount,
  });

  ordersModel copyWith({
    int? warehouse_id,
    List<int>? medicines,
    List<int>? amount,
  }) {
    return ordersModel(
      warehouse_id: warehouse_id ?? this.warehouse_id,
      medicines: medicines ?? this.medicines,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'warehouse_id': warehouse_id,
      'medicines': medicines,
      'amount': amount,
    };
  }
// amount: List<int>.from((map['amount'] as List<int>),)
  factory ordersModel.fromMap(Map<String, dynamic> map) {
    return ordersModel(
      warehouse_id: map['warehouse_id'] as int,
      medicines: List<int>.from((map['medicines'] as List<int>),),
      amount: List<int>.from((map['amount'] as List<int>),)
    );
  }

  String toJson() => json.encode(toMap());

  factory ordersModel.fromJson(String source) => ordersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ordersModel(warehouse_id: $warehouse_id, medicines: $medicines, amount: $amount)';

  @override
  bool operator ==(covariant ordersModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.warehouse_id == warehouse_id &&
      listEquals(other.medicines, medicines) &&
      listEquals(other.amount, amount);
  }

  @override
  int get hashCode => warehouse_id.hashCode ^ medicines.hashCode ^ amount.hashCode;
}
