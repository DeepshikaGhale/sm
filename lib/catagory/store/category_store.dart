import 'package:mobx/mobx.dart';

import '../repository.dart';
import '../request/catagory_get_request.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store{
  final _repository = CatagoryRepository();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  CategoryResponse catagoryResponse = CategoryResponse();

  @action
  Future<CategoryResponse> getCatagoryData() async{
    isLoading = true;
    await _repository.getCatagoryData().then((value) {
      if(value.hasError){
        isLoading = false;
        hasError = true;

        return value;
      }else{
        isLoading = false;
        hasError = false;
        catagoryResponse = value;
        return value;

      }
    });

    return catagoryResponse;  
  }

}
