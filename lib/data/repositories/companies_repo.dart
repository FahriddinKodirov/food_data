
import 'package:food_database/data/api/api_service.dart';
import 'package:food_database/data/model/my_response/my_response.dart';

class CompaniesRepo {
  CompaniesRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getSingleCompanies({String health = '', String nutritionType = '', String category = ''}) =>
      apiService.getSingleCompanies(health: health,nutritionType: nutritionType,category: category);

}