import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_database/bloc/companies_cubit.dart';
import 'package:food_database/data/api/api_service.dart';
import 'package:food_database/data/repositories/companies_repo.dart';
import 'package:food_database/screen/companies_one_page.dart';
import 'package:food_database/screen/food_screen.dart';
import 'package:food_database/util/my_icons.dart';
import 'package:food_database/util/my_utils.dart';
import 'package:search_choices/search_choices.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  TextEditingController chooseController = TextEditingController();
  String selectedValueHealth = '';
  String selectedValueCategory = '';
  String selectedValueNutritionType = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CompaniesCubit(CompaniesRepo(apiService: ApiService())),
        child: Scaffold(
          backgroundColor: const Color(0xFFe8ecef),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height(context) * 0.32,
                  width: width(context),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.14,
                          image: AssetImage(
                            'assets/images/background2.png',
                          ))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height(context) * 0.07,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width(context) * 0.02),
                          child: const Text(
                            'Find Your\nFavorite Food',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width(context) * 0.04),
                          child: const Text(
                            'Categories',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        // !--------------------- one ------------------
                        Container(
                          width: width(context) * 0.9,
                          height: height(context) * 0.1,
                          decoration: BoxDecoration(
                              color: const Color(0xFFe8ecef),
                              borderRadius: BorderRadius.circular(20)),
                          child: SearchChoices.single(
                            disabledHint: const Icon(Icons.abc),
                            displayClearIcon: false,
                            closeButton: Padding(
                              padding: EdgeInsets.only(
                                  left: width(context) * 0.64,
                                  top: height(context) * 0.03),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Accept')),
                            ),
                            menuBackgroundColor: const Color(0xFFe8ecef),
                            icon: null,
                            iconDisabledColor:
                                const Color(0xFFd7dee4).withOpacity(0.5),
                            items: categories.map<DropdownMenuItem<String>>((string) {
                              return (DropdownMenuItem<String>(
                                value: string,
                                child: Text(
                                  string,
                                  textDirection: TextDirection.rtl,
                                ),
                              ));
                            }).toList(),
                            onSaved: (newValue) {
                              selectedValueCategory = newValue as String;
                            },
                            value: selectedValueCategory,
                            hint: Padding(
                                padding: const EdgeInsets.all(3),
                                child: DropdownMenuItem(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(selectedValueCategory == ''
                                        ? '🔍  Select'
                                        : '✔️  $selectedValueCategory'),
                                  ),
                                )),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                selectedValueCategory = value;
                              });
                            },
                            searchInputDecoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: Colors.amber),
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'search',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            fieldDecoration: BoxDecoration(
                              color: const Color(0xFFd7dee4),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFF1F4F3),
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            selectedValueWidgetFn: (selectedValue) {
                              return (Padding(
                                padding: EdgeInsets.only(
                                    left: width(context) * 0.06),
                                child: DropdownMenuItem(
                                    child: Text(
                                  '✔️  $selectedValue',
                                  style: const TextStyle(color: Colors.black),
                                )),
                              ));
                            },
                          ),
                        )
                        // !--------------------------------------------------------------------
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width(context) * 0.66),
                  child: const Text(
                    'Health',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                //! --------------------------- two ----------
                Container(
                  width: width(context) * 0.9,
                  height: height(context) * 0.1,
                  decoration: BoxDecoration(
                      color: const Color(0xFFe8ecef),
                      borderRadius: BorderRadius.circular(20)),
                  child: SearchChoices.single(
                    disabledHint: const Icon(Icons.abc),
                    displayClearIcon: false,
                    closeButton: Padding(
                      padding: EdgeInsets.only(
                          left: width(context) * 0.64,
                          top: height(context) * 0.03),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Accept')),
                    ),
                    menuBackgroundColor: const Color(0xFFe8ecef),
                    icon: null,
                    iconDisabledColor: const Color(0xFFd7dee4).withOpacity(0.5),
                    items: items.map<DropdownMenuItem<String>>((string) {
                      return (DropdownMenuItem<String>(
                        value: string,
                        child: Text(
                          string,
                          textDirection: TextDirection.rtl,
                        ),
                      ));
                    }).toList(),
                    onSaved: (newValue) {
                      selectedValueHealth = newValue as String;
                    },
                    value: selectedValueHealth,
                    hint: Padding(
                        padding: const EdgeInsets.all(3),
                        child: DropdownMenuItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                Text(selectedValueHealth == '' ? '🔍  Select' : '✔️  $selectedValueHealth'),
                          ),
                        )),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedValueHealth = value;
                      });
                    },
                    searchInputDecoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.amber),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'search',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    fieldDecoration: BoxDecoration(
                      color: const Color(0xFFd7dee4),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFF1F4F3),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    selectedValueWidgetFn: (selectedValue) {
                      return (Padding(
                        padding: EdgeInsets.only(left: width(context) * 0.06),
                        child: DropdownMenuItem(
                            child: Text(
                          '✔️  $selectedValue',
                          style: const TextStyle(color: Colors.black),
                        )),
                      ));
                    },
                  ),
                ),
                //! ----------------------------
                SizedBox(
                  height: height(context) * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width(context) * 0.47),
                  child: const Text(
                    'Nutrition-type	',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                // !--------------------- three---------
                Container(
                  width: width(context) * 0.9,
                  height: height(context) * 0.1,
                  decoration: BoxDecoration(
                      color: const Color(0xFFe8ecef),
                      borderRadius: BorderRadius.circular(20)),
                  child: SearchChoices.single(
                    disabledHint: const Icon(Icons.abc),
                    displayClearIcon: false,
                    closeButton: Padding(
                      padding: EdgeInsets.only(
                          left: width(context) * 0.64,
                          top: height(context) * 0.03),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Accept')),
                    ),
                    menuBackgroundColor: const Color(0xFFe8ecef),
                    icon: null,
                    iconDisabledColor: const Color(0xFFd7dee4).withOpacity(0.5),
                    items: nutritionType.map<DropdownMenuItem<String>>((string) {
                      return (DropdownMenuItem<String>(
                        value: string,
                        child: Text(
                          string,
                          textDirection: TextDirection.rtl,
                        ),
                      ));
                    }).toList(),
                    onSaved: (newValue) {
                      selectedValueNutritionType = newValue as String;
                    },
                    value: selectedValueNutritionType,
                    hint: Padding(
                        padding: const EdgeInsets.all(3),
                        child: DropdownMenuItem(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                Text(selectedValueNutritionType == '' ? '🔍  Select' : '✔️  $selectedValueNutritionType'),
                          ),
                        )),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedValueNutritionType = value;
                      });
                    },
                    searchInputDecoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.amber),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'search',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    
                    fieldDecoration: BoxDecoration(
                      color: const Color(0xFFd7dee4),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFF1F4F3),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    selectedValueWidgetFn: (selectedValue) {
                      return (Padding(
                        padding: EdgeInsets.only(left: width(context) * 0.06),
                        child: DropdownMenuItem(
                            child: Text(
                          '✔️  $selectedValue',
                          style: const TextStyle(color: Colors.black),
                        )),
                      ));
                    },
                  ),
                ),
                // !-------------------------------------------

                SizedBox(
                  height: height(context) * 0.03,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CompaniesOnePage(
                                    title: selectedValueCategory,
                                  )));
                      BlocProvider.of<CompaniesCubit>(context).fetchCompanies(
                          health: selectedValueHealth,
                          category: selectedValueCategory,
                          nutritionType: selectedValueNutritionType);
                    },
                    child: const Text('Accept')),

                // !
              ],
            ),
          ),
        ));
  }
}
