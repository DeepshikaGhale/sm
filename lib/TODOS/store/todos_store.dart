//mobx.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:todos/TODOS/entity/model.dart';
import 'package:todos/TODOS/repository.dart';
import 'package:todos/TODOS/request/get_request.dart';

part 'todos_store.g.dart';

class TodosStore = _TodosStore with _$TodosStore;

abstract class _TodosStore with Store{
  final _repository = TodosRepository();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  UserResponse userResponse = UserResponse();

  @observable
  ObserverList<Todos> addedTodoList = ObserverList();

  @action
  void addToNewList(Todos todos){
    addedTodoList.add(todos);
  }

  @action
  void removeFromTodoList(int id){
    addedTodoList.remove
    ((element) => element.id = id);
  }


  @action
  Future<UserResponse> getData() async{
    isLoading = true;
    await _repository.getData().then((value) {
      if(value.hasError){
        isLoading = false;
        hasError = true;

        return value;
      }else{
        isLoading = false;
        hasError = false;
        userResponse = value;

        return value;

      }
    });

    return userResponse;
  }
}
//here the repo is called
