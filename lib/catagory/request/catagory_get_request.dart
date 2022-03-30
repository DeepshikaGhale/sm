import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entity/category.dart';
import '../entity/category_list.dart';


class CategoryGetRequest {
  List<CategoryDetails> categoryList = [];


  final baseUrl = 'https://uat.ordering-iamthegardener-v4.ekbana.net';

  Future<CategoryResponse> getCatagoryData() async{
    
    final result = CategoryResponse();

    final _getCategoryUrl = '$baseUrl/api/v4/category';

    final response = await http.get(Uri.parse(_getCategoryUrl), headers: {
      "Warehouse-Id": "1",
      "api-key":
          "c0e054eac239d5b973d754909d5b676551bbbe4f44285f20524b23a1908afb15"
    });

    // if(response.statusCode == 200){
    //   final jsonData = jsonDecode(response.body);
    //   print(jsonData.toString());
    //   for(var i = 0; i < jsonData.length; i++){
    //     print(jsonData);
    //     final data = CategoryDetails.fromJson(jsonData[i] as Map<String, dynamic>);
    //     categoryList.add(data);
    //   }

    if(response.statusCode == 200){
      final object = jsonDecode(response.body);
      final jsonData = CategoryContainer.fromJson(object);
      print(jsonData.categoryDetailsList[0].title);
      print(jsonData.categoryDetailsList.length);

      return result
        ..errorMessage = ""
        ..hasError = false
        ..response = jsonData.categoryDetailsList
        ..statusCode = response.statusCode;
    } else{
      // final object = jsonDecode(response.body);
      // final code = ErrorContainer.fromJson(object);
      // print(code.errors[0].message);

      return result
        // ..errorMessage = code.errors[0].message
        ..hasError = true
        ..statusCode = response.statusCode;
    }
  }
}

class CategoryResponse {
  bool hasError;
  int? statusCode;
  List<CategoryDetails>? response;
  String errorMessage;

  CategoryResponse(
      {this.hasError = false,
      this.statusCode,
      this.response,
      this.errorMessage = ""});
}
