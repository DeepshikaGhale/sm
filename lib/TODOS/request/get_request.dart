import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/TODOS/entity/model.dart';

class HTTPGetRequest {
  List<Todos> jsonTodos = [];

  Future<UserResponse> getTodoList() async{
    final result = UserResponse();

    const url = 'https://jsonplaceholder.typicode.com/todos';

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      for(var i = 0; i < jsonData.length; i++){
        final data = Todos.fromJson(jsonData[i] as Map<String, dynamic>);
        jsonTodos.add(data);
      }

      print(jsonTodos.length);
      
      return result
        ..errorMessage = 'No Error'
        ..hasError = false
        ..statusCode = response.statusCode
        ..reponse = jsonTodos;
    } else{
      return result
        ..hasError = true
        ..statusCode = response.statusCode
        ..errorMessage = throw Exception();//look after
    }
  }

  
}

class UserResponse {
  UserResponse(
      {this.hasError = false,
       this.errorMessage = '',
      this.statusCode,
      this.reponse});

  bool hasError;
  String errorMessage;
  int? statusCode;
  List<Todos>? reponse;
}
