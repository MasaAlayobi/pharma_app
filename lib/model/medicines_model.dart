// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class medicines_model {
  int id;
  String scientific_name;
  String commercial_name;       
  int category_id;
  String manufacture_company;
  int quantity_available;
  String expiration_date;
  int price;
  medicines_model({
    required this.id,
    required this.scientific_name,
    required this.commercial_name,
    required this.category_id,
    required this.manufacture_company,
    required this.quantity_available,
    required this.expiration_date,
    required this.price,
  });
  

  medicines_model copyWith({
    int? id,
    String? scientific_name,
    String? commercial_name,
    int? category_id,
    String? manufacture_company,
    int? quantity_available,
    String? expiration_date,
    int? price,
  }) {
    return medicines_model(
      id: id ?? this.id,
      scientific_name: scientific_name ?? this.scientific_name,
      commercial_name: commercial_name ?? this.commercial_name,
      category_id: category_id ?? this.category_id,
      manufacture_company: manufacture_company ?? this.manufacture_company,
      quantity_available: quantity_available ?? this.quantity_available,
      expiration_date: expiration_date ?? this.expiration_date,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'scientific_name': scientific_name,
      'commercial_name': commercial_name,
      'category_id': category_id,
      'manufacture_company': manufacture_company,
      'quantity_available': quantity_available,
      'expiration_date': expiration_date,
      'price': price,
    };
  }

  factory medicines_model.fromMap(Map<String, dynamic> map) {
    return medicines_model(
      id: map['id'] as int,
      scientific_name: map['scientific_name'] as String,
      commercial_name: map['commercial_name'] as String,
      category_id: map['category_id'] as int,
      manufacture_company: map['manufacture_company'] as String,
      quantity_available: map['quantity_available'] as int,
      expiration_date: map['expiration_date'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory medicines_model.fromJson(dynamic source) => medicines_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'medicines_model(id: $id, scientific_name: $scientific_name, commercial_name: $commercial_name, category_id: $category_id, manufacture_company: $manufacture_company, quantity_available: $quantity_available, expiration_date: $expiration_date, price: $price)';
  }

  @override
  bool operator ==(covariant medicines_model other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.scientific_name == scientific_name &&
      other.commercial_name == commercial_name &&
      other.category_id == category_id &&
      other.manufacture_company == manufacture_company &&
      other.quantity_available == quantity_available &&
      other.expiration_date == expiration_date &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      scientific_name.hashCode ^
      commercial_name.hashCode ^
      category_id.hashCode ^
      manufacture_company.hashCode ^
      quantity_available.hashCode ^
      expiration_date.hashCode ^
      price.hashCode;
  }
}
