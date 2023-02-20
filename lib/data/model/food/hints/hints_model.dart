import 'package:food_database/data/model/food/hints/food/food.dart';
import 'package:food_database/data/model/food/hints/measures/measures.dart';

class Hints {
  FoodModel foodModel;
  List<Measures> measures;

  Hints({
      required this.foodModel,
      required this.measures
      });

  factory Hints.fromJson(Map<String, dynamic> jsonData) {
    return Hints(
        foodModel: FoodModel.fromJson(jsonData['food']),
        measures: (jsonData['measures'] as List).map((json) => Measures.fromJson(json)).toList()
        );
  }
}
