import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_database/util/my_icons.dart';

class MyUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );
}

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;

back(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.058,
    width: MediaQuery.of(context).size.height * 0.09,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.05)),
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: SvgPicture.asset(MyIcons.left),
    ),
  );
}

List<String> items = [
  "alcohol-free",
  "celery-free",
  "crustacean-free",
  "dairy-free",
  "egg-free",
  "fish-free",
  "fodmap-free",
  "gluten-free",
  "immuno-supportive",
  "keto-friendly",
  "kidney-friendly",
  "kosher",
  "low-fat-abs",
  "low-potassium",
  "low-sugar",
  "lupine-free",
  "mustard-free",
  "no-oil-added",
  "paleo",
  "peanut-free",
  "pescatarian",
  "pork-free",
  "red-meat-free",
  "sesame-free",
  "shellfish-free",
  "soy-free",
  "sugar-conscious",
  "tree-nut-free",
  "vegan",
  "vegetarian",
  "wheat-free",
];

List<String> categories = [
  'generic-foods',
  'generic-meals',
  'packaged-foods',
  'fast-foods'
];


List<String> nutritionType = [
  'cooking',
  'logging',
];


