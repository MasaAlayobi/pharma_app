// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderDetailsModel {
  int amount;
  String medicine;
  OrderDetailsModel({
    required this.amount,
    required this.medicine,
  });
  

  OrderDetailsModel copyWith({
    int? amount,
    String? medicine,
  }) {
    return OrderDetailsModel(
      amount: amount ?? this.amount,
      medicine: medicine ?? this.medicine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'medicine': medicine,
    };
  }

  factory OrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailsModel(
      amount: map['amount'] as int,
      medicine: map['medicine'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailsModel.fromJson(dynamic source) => OrderDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderDetailsModel(amount: $amount, medicine: $medicine)';

  @override
  bool operator ==(covariant OrderDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.amount == amount &&
      other.medicine == medicine;
  }

  @override
  int get hashCode => amount.hashCode ^ medicine.hashCode;
}
