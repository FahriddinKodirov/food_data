import 'package:food_database/data/model/food/hints/food/nutrients/nutrients.dart';

class FoodModel {
  String foodId;
  String label;
  String knownAs;
  Nutrients nutrients;
  String category;
  String categoryLabel;
  String image;

  FoodModel(
      {required this.foodId,
      required this.label,
      required this.knownAs,
      required this.nutrients,
      required this.category,
      required this.categoryLabel,
      required this.image,
      });

  factory FoodModel.fromJson(Map<String, dynamic> jsonData) {
    return FoodModel(
        foodId: jsonData['foodId'] ?? '',
        label: jsonData['label'] ?? '',
        knownAs: jsonData['knownAs'] ?? '',
        nutrients: Nutrients.fromJson(jsonData['nutrients']),
        category: jsonData['category'] ?? '',
        categoryLabel: jsonData['categoryLabel'] ?? '',
        image: jsonData['image'] ?? '',
        );
  }
}
