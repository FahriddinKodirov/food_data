import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_database/bloc/companies_state.dart';
import 'package:food_database/data/model/my_response/my_response.dart';
import 'package:food_database/data/repositories/companies_repo.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepo companiesRepo;

  CompaniesCubit(this.companiesRepo) : super(InitialCompaniesState()){
    fetchCompanies();
  }

  fetchCompanies({String health = '',String category= '',String nutritionType= ''}) async {
    emit(LoadCompaniesInProgress());
    MyResponse myResponse = await companiesRepo.getSingleCompanies(health: health,category: category,nutritionType: nutritionType);
    if (myResponse.error.isEmpty) {
      emit(LoadCompaniesInSuccess(foodsModel: myResponse.data));
      print('--------${myResponse.data}');
    } else {
      emit(LoadCompaniesInFailure(errorText: myResponse.error));
    }
  }
}
