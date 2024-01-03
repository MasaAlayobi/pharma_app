// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class getSearchModel {
  String scientific_name;
  String commercial_name;
  String manufacture_company;
  int quantity_available;
  String expiration_date;
  int price;
  getSearchModel({
    required this.scientific_name,
    required this.commercial_name,
    required this.manufacture_company,
    required this.quantity_available,
    required this.expiration_date,
    required this.price,
  });
  

  getSearchModel copyWith({
    String? scientific_name,
    String? commercial_name,
    String? manufacture_company,
    int? quantity_available,
    String? expiration_date,
    int? price,
  }) {
    return getSearchModel(
      scientific_name: scientific_name ?? this.scientific_name,
      commercial_name: commercial_name ?? this.commercial_name,
      manufacture_company: manufacture_company ?? this.manufacture_company,
      quantity_available: quantity_available ?? this.quantity_available,
      expiration_date: expiration_date ?? this.expiration_date,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scientific_name': scientific_name,
      'commercial_name': commercial_name,
      'manufacture_company': manufacture_company,
      'quantity_available': quantity_available,
      'expiration_date': expiration_date,
      'price': price,
    };
  }

  factory getSearchModel.fromMap(Map<String, dynamic> map) {
    return getSearchModel(
      scientific_name: map['scientific_name'] as String,
      commercial_name: map['commercial_name'] as String,
      manufacture_company: map['manufacture_company'] as String,
      quantity_available: map['quantity_available'] as int,
      expiration_date: map['expiration_date'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory getSearchModel.fromJson(String source) => getSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'getSearchModel(scientific_name: $scientific_name, commercial_name: $commercial_name, manufacture_company: $manufacture_company, quantity_available: $quantity_available, expiration_date: $expiration_date, price: $price)';
  }

  @override
  bool operator ==(covariant getSearchModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.scientific_name == scientific_name &&
      other.commercial_name == commercial_name &&
      other.manufacture_company == manufacture_company &&
      other.quantity_available == quantity_available &&
      other.expiration_date == expiration_date &&
      other.price == price;
  }

  @override
  int get hashCode {
    return scientific_name.hashCode ^
      commercial_name.hashCode ^
      manufacture_company.hashCode ^
      quantity_available.hashCode ^
      expiration_date.hashCode ^
      price.hashCode;
  }
}
