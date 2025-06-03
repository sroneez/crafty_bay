import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  int _perPageDataCount = 10;
  int _currentPage = 0;
  int? _totalPage;
  String? _errorMessage;
  bool _isLoading = false;

  int? get totalPage => _totalPage;

  String? get errorMessage => _errorMessage;

  List<CategoryModel> get categoryList => _categoryModel;

  bool get isLoading => _isLoading;

  bool get isInitialLoading => _isInitialLoading;

  bool _isInitialLoading = true;
  List<CategoryModel> _categoryModel = [];

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _currentPage++;
    if (!_isInitialLoading) {
      _isLoading = true;
    } else {
      _isInitialLoading = false;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.categoryListUrl, queryParams: {
      'count': _perPageDataCount,
      'page': _currentPage,
    });
    if (response.isSuccess) {
      List<CategoryModel> list = [];
      for (Map<String, dynamic> data in response.responseData!['data']
          ['results']) {
        list.add(CategoryModel.fromJson(data));
      }
      _categoryModel.addAll(list);
      _totalPage = response.responseData!['data']['last_page'];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    if (!_isInitialLoading) {
      _isLoading = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> initialLoad() {
    _currentPage = 0;
    _categoryModel = [];
    _isInitialLoading = true;
    return getCategoryList();
  }
}
