import 'package:dio/dio.dart';
import 'package:food_database/data/model/food/foods_model.dart';
import 'package:food_database/data/model/my_response/my_response.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  
  Future<MyResponse> getSingleCompanies({String health = '', String nutritionType = '', String category = ''}) async {
    MyResponse myResponse = MyResponse(error: "");
    
    try {
      Response response = await dio.get(dio.options.baseUrl,queryParameters: {
        'app_id':'05d387a1',
        'app_key':'fce49db6c7b785162e3a3809b834f72a',
        'health': health == ''?'vegan':health,
        'nutritionType': nutritionType == ''?'cooking':nutritionType,
        'category': category == ''?'generic-foods':category,


      });
      if (response.statusCode == 200) {
        print('statusCode ${response.statusCode}');
        myResponse.data = FoodsModel.fromJson(response.data as Map<String, dynamic>);
        print('statusCode ${myResponse.data}');
      }
    } catch (err) {
      myResponse.error = err.toString();
      //print(err.toString());
    }

    return myResponse;
  }

 
}