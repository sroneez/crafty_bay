import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_otp_model.dart';
import 'package:get/get.dart';

class SignUpOtpController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUpOtp(SignUpOtpModel signUpOtpModel) async {
    bool isSuccess = false;
    _isLoading = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signUpOtpUrl,
      body: signUpOtpModel.toJson(),
    );
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _isLoading = false;
    update();
    return isSuccess;
  }
}
