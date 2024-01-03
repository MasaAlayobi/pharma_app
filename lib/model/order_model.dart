// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:medicine_warehouse/model/medicines_model.dart';

class order_provider_model {
  medicines_model medicine_order;
  int amount;
  order_provider_model({
    required this.medicine_order,
    required this.amount,
  });
 
 

  order_provider_model copyWith({
    medicines_model? medicine_order,
    int? amount,
  }) {
    return order_provider_model(
      medicine_order: medicine_order ?? this.medicine_order,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicine_order': medicine_order.toMap(),
      'amount': amount,
    };
  }

  factory order_provider_model.fromMap(Map<String, dynamic> map) {
    return order_provider_model(
      medicine_order: medicines_model.fromMap(map['medicine_order'] as Map<String,dynamic>),
      amount: map['amount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory order_provider_model.fromJson(String source) => order_provider_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'order_provider_model(medicine_order: $medicine_order, amount: $amount)';

  @override
  bool operator ==(covariant order_provider_model other) {
    if (identical(this, other)) return true;
  
    return 
      other.medicine_order == medicine_order &&
      other.amount == amount;
  }

  @override
  int get hashCode => medicine_order.hashCode ^ amount.hashCode;
}
