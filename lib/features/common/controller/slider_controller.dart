import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/common/data/models/slide_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _getSliderInProgress = false;
  List<SlideModel> _sliderList = [];
  String? _errorMessage;

  List<SlideModel> get sliders => _sliderList;
  String? get errorMessage => _errorMessage;
  bool get getSliderInProgress => _getSliderInProgress;

  Future<bool> getSlider() async{
    bool isSuccess = false;
    _getSliderInProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: AppUrls.slidersUrl);
    if(response.isSuccess){
      List<SlideModel> list =[];
      for(Map<String, dynamic> data in response.responseData?['data']['results']?? []){
        list.add(SlideModel.fromJson(data));
      }
      _sliderList = list;
      _errorMessage = null;
      isSuccess= true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _getSliderInProgress = false;
    update();
    return isSuccess;
  }
}
