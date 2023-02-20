import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_database/bloc/companies_cubit.dart';
import 'package:food_database/data/api/api_service.dart';
import 'package:food_database/data/repositories/companies_repo.dart';
import 'package:food_database/screen/companies_one_page.dart';
import 'package:food_database/screen/food_screen.dart';
import 'package:food_database/screen/select.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
     BlocProvider(create: (context) => CompaniesCubit(CompaniesRepo(apiService: ApiService())))
  ], child: const MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SelectScreen()
    );
  }
}
