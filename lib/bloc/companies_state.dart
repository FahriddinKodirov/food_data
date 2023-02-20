import 'package:food_database/data/model/companies_model/companies.dart';
import 'package:food_database/data/model/food/foods_model.dart';

abstract class CompaniesState {}

class InitialCompaniesState extends CompaniesState {}

class LoadCompaniesInProgress extends CompaniesState {}

class LoadCompaniesInSuccess extends CompaniesState {
  LoadCompaniesInSuccess({required this.foodsModel});

  final FoodsModel foodsModel;
}

class LoadCompaniesInFailure extends CompaniesState {
  LoadCompaniesInFailure({required this.errorText});

  final String errorText;
}
