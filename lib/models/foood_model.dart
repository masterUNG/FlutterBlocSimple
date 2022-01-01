import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodModel {
  final String id;
  final String catigory;
  final String nameFood;
  final String price;
  final String detail;
  final String image; 
  FoodModel({
    required this.id,
    required this.catigory,
    required this.nameFood,
    required this.price,
    required this.detail,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'catigory': catigory,
      'nameFood': nameFood,
      'price': price,
      'detail': detail,
      'image': image,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: (map['id'] ?? '') as String,
      catigory: (map['catigory'] ?? '') as String,
      nameFood: (map['nameFood'] ?? '') as String,
      price: (map['price'] ?? '') as String,
      detail: (map['detail'] ?? '') as String,
      image: (map['image'] ?? '') as String,
    );
  }

  factory FoodModel.fromJson(String source) => FoodModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
