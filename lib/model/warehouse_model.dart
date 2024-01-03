// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class warehouse_model {
  int id;
  String WareHouse_name;
  warehouse_model({
    required this.id,
    required this.WareHouse_name,
  });

  warehouse_model copyWith({
    int? id,
    String? WareHouse_name,
  }) {
    return warehouse_model(
      id: id ?? this.id,
      WareHouse_name: WareHouse_name ?? this.WareHouse_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'WareHouse_name': WareHouse_name,
    };
  }

  factory warehouse_model.fromMap(Map<String, dynamic> map) {
    return warehouse_model(
      id: map['id'] as int,
      WareHouse_name: map['WareHouse_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory warehouse_model.fromJson(String source) => warehouse_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'warehouse_model(id: $id, WareHouse_name: $WareHouse_name)';

  @override
  bool operator ==(covariant warehouse_model other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.WareHouse_name == WareHouse_name;
  }

  @override
  int get hashCode => id.hashCode ^ WareHouse_name.hashCode;
}
