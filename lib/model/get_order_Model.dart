// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class getOrderModel {
  int id;
  String payment_status;
  String order_status;
  int price;
  String warehouse_name;
  getOrderModel({
    required this.id,
    required this.payment_status,
    required this.order_status,
    required this.price,
    required this.warehouse_name,
  });
  

  getOrderModel copyWith({
    int? id,
    String? payment_status,
    String? order_status,
    int? price,
    String? warehouse_name,
  }) {
    return getOrderModel(
      id: id ?? this.id,
      payment_status: payment_status ?? this.payment_status,
      order_status: order_status ?? this.order_status,
      price: price ?? this.price,
      warehouse_name: warehouse_name ?? this.warehouse_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'payment_status': payment_status,
      'order_status': order_status,
      'price': price,
      'warehouse_name': warehouse_name,
    };
  }

  factory getOrderModel.fromMap(Map<String, dynamic> map) {
    return getOrderModel(
      id: map['id'] as int,
      payment_status: map['payment_status'] as String,
      order_status: map['order_status'] as String,
      price: map['price'] as int,
      warehouse_name: map['warehouse_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory getOrderModel.fromJson(String source) => getOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'getOrderModel(id: $id, payment_status: $payment_status, order_status: $order_status, price: $price, warehouse_name: $warehouse_name)';
  }

  @override
  bool operator ==(covariant getOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.payment_status == payment_status &&
      other.order_status == order_status &&
      other.price == price &&
      other.warehouse_name == warehouse_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      payment_status.hashCode ^
      order_status.hashCode ^
      price.hashCode ^
      warehouse_name.hashCode;
  }
}
