import 'package:food_database/data/model/food/hints/hints_model.dart';
import 'package:food_database/data/model/food/links/links.dart';
import 'package:food_database/data/model/food/links/next/next.dart';

class FoodsModel {
  String text;
  List parsed;
  List<Hints> hints;
  // Next next;

  FoodsModel({
      required this.text,
      required this.parsed,
      required this.hints,
      // required this.next,
    });

  factory FoodsModel.fromJson(Map<String, dynamic> jsonData) {
    return FoodsModel(
        text: jsonData['text'] ?? '',
        parsed: jsonData['parsed'] ?? [],
        hints: (jsonData['hints'] as List).map((json) => Hints.fromJson(json)).toList(),
        // next: Next.fromJson(jsonData['next'])
        );
  }
}
