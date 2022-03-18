//singleton class : the instance of the constructor can be used only once
//this class works between store and request (in this case get request)
//this class acts as a mediator
//it is called in store

import 'package:todos/TODOS/request/get_request.dart';

class TodosRepository{
  factory TodosRepository(){
    return _instance;
  }

  TodosRepository._internal();

  static final TodosRepository _instance = TodosRepository._internal();

  Future<UserResponse> getData() async{
    final response = await HTTPGetRequest().getTodoList();
    return response;
  }
}