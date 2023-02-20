import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_database/data/model/food/hints/food/food.dart';
import 'package:food_database/util/my_icons.dart';
import 'package:food_database/util/my_utils.dart';

class FoodScreen extends StatelessWidget {
  // final FoodModel foodModel;

  const FoodScreen({super.key, 
  // required this.foodModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context)*0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           SizedBox(height: height(context)*0.08,),
           const Text('Find Your\nFavorite Food',style: TextStyle(fontSize: 30),),
           SizedBox(height: height(context)*0.02,),
           search(context),
           SizedBox(height: height(context)*0.02,),
           const Text('Food Categories',style: TextStyle(fontSize: 20),),
           SizedBox(height: height(context)*0.02,),
           Expanded(
             child: GridView.builder(gridDelegate: const 
             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
             itemBuilder:(context, index) {
               return Container(
                decoration: BoxDecoration(
                color: Colors.amber,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(children: [
                  Text('')
                ],
                  
                ),
               );
             },
             ),
           )
        ],),
      )
    );
  }
}
  search(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: width(context) * 0.7,
            height: height(context) * 0.072,
            decoration: BoxDecoration(
                color: const Color(0xFFF1F4F3),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              cursorHeight: 22,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search fresh groceries',
                  hintStyle: const TextStyle(height: 1.7),
                  icon: Padding(
                      padding: EdgeInsets.only(
                          left: width(context) * 0.05,
                          top: height(context) * 0.01),
                      child: SvgPicture.asset(MyIcons.search))),
            )),
        InkWell(
          onTap: () {
          },
          child: SvgPicture.asset(
            MyIcons.searchPage,
            width: 58,
          ),
        ),
      ],
    );
  }
