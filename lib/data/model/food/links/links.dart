import 'package:food_database/data/model/food/links/next/next.dart';

class Links {
  Next? next;

  Links({required this.next});

  factory Links.fromJson(Map<String, Object?> jsonData) {
    return Links(
         next: Next.fromJson(jsonData)
      );
  }
}
