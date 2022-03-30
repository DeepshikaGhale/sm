
import 'package:todos/catagory/request/catagory_get_request.dart';

class CatagoryRepository {
  factory CatagoryRepository() {
    return _instance;
  }

  CatagoryRepository._internal();

  static final CatagoryRepository _instance = CatagoryRepository._internal();

  Future<CategoryResponse> getCatagoryData() async {
    final response = await CategoryGetRequest().getCatagoryData();
    return response;
  }
}
