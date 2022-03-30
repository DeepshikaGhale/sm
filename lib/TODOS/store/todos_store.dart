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
  ObservableList<Todos> addedTodoList = <Todos>[].asObservable();

  @action
  void addToNewList(Todos todos){
    addedTodoList.add(todos);
  }

  @action
  void removeFromTodoList(Todos todo){
    addedTodoList.remove(todo);
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
