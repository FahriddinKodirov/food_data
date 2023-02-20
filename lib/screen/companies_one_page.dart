import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_database/bloc/companies_cubit.dart';
import 'package:food_database/bloc/companies_state.dart';
import 'package:food_database/data/model/food/hints/food/food.dart';
import 'package:food_database/data/model/food/hints/hints_model.dart';
import 'package:food_database/screen/food_screen.dart';
import 'package:food_database/util/my_utils.dart';

class CompaniesOnePage extends StatelessWidget {
  final String title;
  const CompaniesOnePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
        elevation: 0,
        backgroundColor:const Color(0xFFe8ecef),
        title: Text(title.toUpperCase(),style:const TextStyle(color: Colors.black),),
      ),
      backgroundColor: const Color(0xFFe8ecef),
      body: BlocConsumer<CompaniesCubit, CompaniesState>(
          builder: (context, state) {
        if (state is InitialCompaniesState) {
          return const Text('data yoq', style: TextStyle(fontSize: 24));
        } else if (state is LoadCompaniesInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadCompaniesInSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context) * 0.01,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: width(context)*0.06),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: height(context) * 0.3,
                    crossAxisSpacing: width(context) * 0.04,
                    mainAxisSpacing: height(context) * 0.03,
                  ),
                  dragStartBehavior: DragStartBehavior.down,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.foodsModel.hints.length,
                  itemBuilder: (context, index) {
                    FoodModel foodModel =
                        state.foodsModel.hints[index].foodModel;
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: NetworkImage(foodModel.image)),
                          color: const Color(0xFFd7dee4).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height(context) * 0.2,
                            ),
                            Text(foodModel.category),
                            Text(foodModel.knownAs),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        } else if (state is LoadCompaniesInFailure) {
          return Center(child: Text(state.errorText));
        }
        return const SizedBox();
      }, listener: (context, state) {
        if (state is LoadCompaniesInSuccess) {
          MyUtils.getMyToast(message: 'Category name: ${title}');
        } else {
          MyUtils.getMyToast(message: 'hatolik yuz berdi');
        }
      }),
    );
  }
}
